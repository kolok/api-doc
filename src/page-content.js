import React from 'react';

class PageContent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {page: {}};
    }
    render() {
        return (
            <div className="page-content" dangerouslySetInnerHTML={{__html: this.props.page.content}}>
            </div>
            );
    }
};

export default PageContent;
