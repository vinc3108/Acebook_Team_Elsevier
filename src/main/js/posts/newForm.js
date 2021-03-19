import React from 'react';

class NewForm extends React.Component{
    constructor(props) {
        super(props)
        this.input = React.createRef();
        this.handleSubmit = this.handleSubmit.bind(this);
        this.host = 'http://' + window.location.host + '/api/posts';
    }

    handleSubmit(event){
        event.preventDefault();
        fetch(this.host ,{
            method: 'POST',
            headers:{
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({content: this.input.current.value}),

        }).then((response) => {return response.json()}).then((data) => {this.props.updatePosts(data); this.input.current.value = ''})
    }

    render(){
        return(
            <form onSubmit={this.handleSubmit}>
                <label>
                    What are you thinking about?
                    <input type="text" ref={this.input}/>
                </label>
                <input type="submit" value="Submit"/>
            </form>
        );
    }
}

export default NewForm;