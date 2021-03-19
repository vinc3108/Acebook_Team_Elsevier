import React from 'react';
import Posts from './posts';
import NewForm from './newForm';
const client = require('../client');

class PostsBuilder extends React.Component {
  constructor(props) {
    super(props)
    this.state = {posts: []};
    this.updatePosts = this.updatePosts.bind(this);
  }

  updatePosts(data){
    this.setState({posts: this.state.posts.concat([data])});
  }

  componentDidMount() {
    client({method: 'GET', path: '/api/posts'}).then(response => {
      this.setState({posts: response.entity._embedded.posts});
    });
  }

	render() {
		return (
      <div id='post-list'>
        <NewForm updatePosts = {this.updatePosts}/>
        <Posts posts={this.state.posts}/>
      </div>
		)
	}
}

export default PostsBuilder;
