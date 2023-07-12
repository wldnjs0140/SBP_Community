package com.drill.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import	org.springframework.transaction.annotation.Transactional;

import com.drill.domain.Post;
import com.drill.domain.repo.PostRepository;

@Service
public class PostService {
	@Autowired
	private PostRepository postRepository;

	// 글쓰기(=글 저장)
	@Transactional
	public void write(Post post) {
		postRepository.save(post);
	}

	/* @Transactional 임포트 할때 잘보고 하기 
	   import org.springframework.transaction.annotation.Transactional;*/
	
	@Transactional(readOnly=true)
	public Page<Post> getList(Pageable pageable) {
		return postRepository.findAll(pageable);
	}
}
