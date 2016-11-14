import React from 'react';

class PageContent extends React.Component {
    render() {
        //console.log('PageContent.render');
        //console.log(this.props.page.content);
        if ( this.props.page.content !== undefined )
        {
            return (
                <div className="page-content" dangerouslySetInnerHTML={{__html: this.props.page.content}}>
                </div>
                );
        }
        else
        {
            return null;
        }
    }
};

export default PageContent;
