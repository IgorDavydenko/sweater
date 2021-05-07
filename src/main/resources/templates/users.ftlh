<#import "patterns/common.ftlh" as common>

<@common.htmlTree>
    <h2>Users list</h2>
    <table>
        <thead>
            <td>Name</td>
            <td>Roles</td>
            <td></td>
        </thead>
        <tbody>
            <#list users as user>
                <tr>
                    <td>${user.username}</td>
                    <td>
                        <#list user.userRoles as role>
                            ${role}<#sep>,
                        </#list>
                    </td>
                    <td>${user.active?c}</td>
                    <td>
                        <a href="/users/${user.id}">Edit</a>
                    </td>
                </tr>
            </#list>
        </tbody>
    </table>
</@common.htmlTree>