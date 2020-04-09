<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as login>

<@common.page>
    <@login.logout/>
    <div>
        <form method="post" action="main">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="text" name="message" placeholder="input message" />
            <input type="text" name="tag" placeholder="input tag" />
            <button type="submit">Add</button>
        </form>
    </div>
    <div>Messages list:</div>
    <div>
        <form method="post" action="filter">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="text" name="tag" placeholder="tag" />
            <button type="submit">Filter by tag</button>
        </form>
    </div>
    <#list messages>
        <table>
            <#items as message>
                <tr>
                    <th>${message.id}</th>
                    <th>${message.text}</th>
                    <th>${message.tag}</th>
                    <th>${message.authorName}</th>
                </tr>
            </#items>
        </table>
        <#else>
        No messages
    </#list>

</@common.page>