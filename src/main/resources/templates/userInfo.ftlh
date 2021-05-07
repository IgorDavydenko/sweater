<#import "patterns/common.ftlh" as common>

<@common.htmlTree>
<h2>Edit user info</h2>

<div>
    <form method="post" action="/users">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="text" name="username" value="${user.username}">
        <#list roles as role>
            <div>
                <label>
                    <input type="checkbox"
                           name="${role}"
                            ${user.userRoles?seq_contains(role)?string("checked", "")}
                    >${role}</input>
                </label>
            </div>
        </#list>
        <input type="hidden" name="id" value="${user.id}"/>
        <button type="submit">Save</button>
    </form>
</div>

</@common.htmlTree>