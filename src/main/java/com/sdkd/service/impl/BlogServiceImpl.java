package com.sdkd.service.impl;

import com.sdkd.dao.BlogDao;
import com.sdkd.dao.CommentDao;
import com.sdkd.dao.UserDao;
import com.sdkd.dto.BlogDTO;
import com.sdkd.dto.CommentDTO;
import com.sdkd.model.Blog;
import com.sdkd.model.Comment;
import com.sdkd.model.User;
import com.sdkd.service.BlogService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;


import javax.annotation.Resource;
import java.util.*;

/**
 * @author Young
 * @date 2020/4/11 14:06
 * @see com.sdkd.service.impl
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Resource
    private BlogDao blogDao;

    @Resource
    private CommentDao commentDao;

    @Resource
    private UserDao userDao;

    public List<BlogDTO> findAll() {
        //查询所有的说说
        List<Blog> blogList = blogDao.findAll();
        //conver中转化为所有DTO对象 将blog中插入username和comment等信息
        return converModel2DTO(blogList);
    }

    @Override
    public List<BlogDTO> findUserBlog(Integer user_id) {
        return converModel2DTO(blogDao.findUserBlog(user_id));
    }

    @Override
    public Blog findById(Integer blog_id) {
        return blogDao.findById(blog_id);
    }


    @Override
    public void saveBlog(BlogDTO blogDTO) {
//        System.err.println(blogDTO.getUser_id()+blogDTO.getBlog_text()+" "+blogDTO.getBlog_date());
        blogDao.saveBlog(blogDTO.getUser_id(),blogDTO.getBlog_text(),blogDTO.getBlog_date(),blogDTO.getIs_expert());
    }

    @Override
    public int findByUser(Integer user_id) {
        int count = blogDao.findByUser(user_id);
        return count;
    }

    @Override
    public boolean deleteBlog(Integer blog_id) {
        return blogDao.deleteBlog(blog_id);
    }

    private List<BlogDTO> converModel2DTO(List<Blog> blogList) {
        if(CollectionUtils.isEmpty(blogList)){
            System.err.println("CollectionUtils.isEmpty(blogList)");
            return Collections.EMPTY_LIST;
        }
        List<BlogDTO> blogDTOList = new ArrayList<BlogDTO>();
        for(Blog blog:blogList){
            BlogDTO blogDTO = new BlogDTO();
            blogDTO.setBlog_id(blog.getBlog_id());
            blogDTO.setBlog_text(blog.getBlog_text());
            blogDTO.setBlog_date(blog.getBlog_date());
            blogDTO.setIs_hot(blog.getIs_hot());
            blogDTO.setPraise_count(blog.getPraise_count());
            blogDTO.setIs_expert(blog.getIs_expert());
            blogDTO.setUser_id(blog.getUser_id());
            blogDTO.setBlog_title(blog.getBlog_title());
            //动态插入username和comments list
            User user = userDao.findById(blog.getUser_id());
            blogDTO.setUserName(user.getName());
            //给每个评论DTO上username
            List<Comment> comments = commentDao.getSonComment(blog.getBlog_id());
            List<CommentDTO> commentDTOS = converComment2DTO(comments);

            blogDTO.setCommentDTOS(commentDTOS);
            //将新的blogDTO add到DTOList中
            blogDTOList.add(blogDTO);
        }
        return blogDTOList;
    }

    private List<CommentDTO> converComment2DTO(List<Comment> comments) {
        if(CollectionUtils.isEmpty(comments)){
            System.err.println("CollectionUtils.isEmpty(comments)");
            return Collections.EMPTY_LIST;
        }
        List<CommentDTO> commentDTOList = new ArrayList<CommentDTO>();
        Map<Integer,CommentDTO> map = new HashMap<>();
        List<CommentDTO> all = new ArrayList<>();
        for (Comment comment:comments){
            CommentDTO commentDTO = setInfo(comment);
            all.add(commentDTO);//这里所有的comment转为DTO带name对象
        }
        Collections.sort(all, new Comparator<CommentDTO>() {
            @Override
            public int compare(CommentDTO o1, CommentDTO o2) {
                return o1.getComment_id() - o2.getComment_id();
            }
        });
        for (CommentDTO commentDTO: all){
            if(commentDTO.getParent_id()==null){
                commentDTOList.add(commentDTO);
            }
            map.put(commentDTO.getComment_id(),commentDTO);
        }

        for(CommentDTO commentDTO: all){
            if (commentDTO.getParent_id()!=null){
                CommentDTO parent = map.get(commentDTO.getParent_id());
                if(parent!=null&&parent.getChild()==null){
                    parent.setChild(new ArrayList<CommentDTO>());
                }
                //新加方法，发现有父评论值的getParent为null，删除该评论
                //等价于级联删除
                if(parent==null){
                    commentDao.deleteComment(commentDTO.getComment_id());
                    continue;
                }
                parent.getChild().add(commentDTO);
            }
        }
        return commentDTOList;
    }

    private CommentDTO setInfo(Comment comment){
        CommentDTO commentDTO = new CommentDTO();
        User user = userDao.findById(comment.getUser_id());
        commentDTO.setUserName(user.getName());
        commentDTO.setUser_id(comment.getUser_id());
        commentDTO.setBlog_id(comment.getBlog_id());
        commentDTO.setComment_id(comment.getComment_id());
        commentDTO.setComment_text(comment.getComment_text());
        commentDTO.setComment_date(comment.getComment_date());
        commentDTO.setParent_id(comment.getParent_id());
        commentDTO.setPraise_count(comment.getPraise_count());
        return commentDTO;
    }
}
