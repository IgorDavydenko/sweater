<#import "patterns/common.ftlh" as common>

<@common.htmlTree>
    <div>
        <form method="post" action="/index" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="text" name="message" placeholder="input message" />
            <input type="text" name="tag" placeholder="input tag" />
            <input type="file" name="file">
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
                            <td>${message.text}</td>
                            <td>${message.tag}</td>
                            <td>${message.authorName}</td>
                            <td>
                                <#if message.fileName??>
                                    <img src="/img/${message.fileName}">
                                </#if>
                            </td>
                        </tr>
                    </#items>
                </table>
            <#else>
                No messages
            </#list>
        </div>
    </div>
</@common.htmlTree>