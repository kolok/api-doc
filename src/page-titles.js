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
                var identifierTag = match[2];
                var key = match.join('-');
                return (
                    <PageTitle key={key} identifierTag={identifierTag} classTag={classTag} titlePage={titlePage} />
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
    anchorThis(id) {
        window.location = window.location.origin + "#" + id
    }
    render() {
        if (this.props.identifierTag !== undefined)
        {
            return (
                <li className={this.props.classTag} onClick={this.anchorThis.bind(this, this.props.identifierTag)}>{this.props.titlePage}</li>
                );
        }
        else
        {
            return (
                <li className={this.props.classTag}>{this.props.titlePage}</li>
                );
        }
    }
};

function getTitles(content) {
    var myRegexp = /<(h\d)([^>]*)>([^<]*)<\/h\d>/;
    var matches = [];
    var match = myRegexp.exec(content);
    while (match = myRegexp.exec(content)) {
        var id = undefined;
        if (match[2] !== "")
        {
            var myRegexp2 = /id=[\"\'](\w+)[\"\']/;
            var matchId = myRegexp2.exec(match[2]);
            if (matchId !== null)
            { id = matchId[1] }
        }
        matches.push([match[1], match[3], id]);
        content = content.replace(myRegexp, "");
    }
    return matches;
}

export default PageTitles;
