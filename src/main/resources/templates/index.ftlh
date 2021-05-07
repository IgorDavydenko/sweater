<#import "patterns/common.ftlh" as common>

<@common.htmlTree>
    <div>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Sign Out"/>
        </form>
    </div>
    <div>
        <a href="/users">Edit users list</a>
    </div>
    <div>
        <form method="post" action="/index">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="text" name="message" placeholder="input message" />
            <input type="text" name="tag" placeholder="input tag" />
            <button type="submit">Add</button>
        </form>
    </div>
    <div>
        <div>
            <form method="get" action="/index">
                <input type="text" name="filter" value="${filter!""}" placeholder="filter by tag" />
                <button type="submit">Filter</button>
            </form>
        </div>
        <div>
            <h2>Messages:</h2>
            <#list messages>
                <table>
                    <#items as message>
                        <tr>
                            <th>${message.text}</th>
                            <th>${message.tag}</th>
                            <th>${message.authorName}</th>
                        </tr>
                    </#items>
                </table>
            <#else>
                No messages
            </#list>
        </div>
    </div>
</@common.htmlTree>