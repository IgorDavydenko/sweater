<#macro authForm path isRegisterForm>
    <form action="${path}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="row mb-3">
            <label for="inputUserName" class="col-sm-2 col-form-label">User Name: </label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="username" id="inputUserName"/>
            </div>
        </div>
        <div class="row mb-3">
            <label for="inputPassword" class="col-sm-2 col-form-label">Password: </label>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="password" id="inputPassword"/>
            </div>
        </div>
        <#if !isRegisterForm>
            <a class="btn btn-light" href="/registration">Register</a>
        </#if>
        <button type="submit" class="btn btn-primary">
            <#if !isRegisterForm>
                Sign in
            <#else>
                Sign up
            </#if>
        </button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Sing out</button>
    </form>
</#macro>