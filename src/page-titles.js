import React from 'react';

class PageTitles extends React.Component {
    render() {
        if ( this.props.page.content !== undefined )
        {
            var matches = getTitles(this.props.page.content);
            var i = 0;
            var PageTitleList2 = matches.map( function(match){
                i+=1;
                var classTag = match[0];
                var titlePage = match[1];
                var key = classTag+'-'+titlePage;
                return (
                    <PageTitle key={key} classTag={classTag} titlePage={titlePage} />
                    );
            });
            return (
                <ul className="page-titles">
                    {PageTitleList2}
                </ul>
                );
        }
        else
        {
            return null;
        }
    }
};

class PageTitle extends React.Component {
    render() {
        return (
            <li className={this.props.classTag}>{this.props.titlePage}</li>
            );
    }
};

function getTitles(content) {
    var myRegexp = /\<(h\d)\>([\w\s\(\)\?]*)\<\/h\d\>/;
    var matches = [];
    var match = myRegexp.exec(content);
    //console.log(content);
    while (match = myRegexp.exec(content)) {
        matches.push([match[1], match[2]]);
        content = content.replace(myRegexp, "");
    }
    return matches;
}

export default PageTitles;
