<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as login>

<@common.page>
    Login:
    <a href="/registration">Registration</a>
    <@login.login "login" />
</@common.page>