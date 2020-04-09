<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as login>

<@common.page>
    ${message!""}
    Add new user:
    <@login.login "registration" />
</@common.page>