
{include file='header.tpl'}

<main class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner">
						<div class="card">
							<div class="card-main">
								<div class="card-header">
									<div class="card-inner">
										<h1 class="card-heading"><img src="/images/register.jpg" height=100% width=100% /></h1>
									</div>
								</div>
								<div class="card-inner">


										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="name">昵稱</label>
													<input class="form-control" id="name" type="text">
												</div>
											</div>
										</div>

										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="email">郵箱(唯一憑證請認真對待)</label>
													<input class="form-control" id="email" type="text">
												</div>
											</div>
										</div>
										{*



                                  			<!--<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
											<label class="floating-label" for="theme">主題</label>
											<select id="theme" class="form-control">

													<option value="{$theme}">{$theme}</option>

													</select>
												</div>
											</div>
										</div>-->




                                  *}
										{if $enable_email_verify == 'true'}
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="email_code">郵箱驗證碼</label>
													<input class="form-control" id="email_code" type="text" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
													<button id="email_verify" class="btn btn-block btn-brand-accent waves-attach waves-light">點擊獲取驗證碼</button>
												</div>
											</div>
										</div>

                                  {/if}


										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="passwd">密碼</label>
													<input class="form-control" id="passwd" type="password">
												</div>
											</div>
										</div>

										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="repasswd">重複密碼</label>
													<input class="form-control" id="repasswd" type="password">
												</div>
											</div>
										</div>


										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="imtype">選擇您的聯絡方式</label>
													<select class="form-control" id="imtype">
														<option></option>
														<option value="1">微信</option>
														<option value="2">QQ</option>
														<option value="3">Facebook</option>
														<option value="4">Telegram</option>
													</select>
												</div>
											</div>
										</div>


										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="wechat">在這輸入聯絡方式賬號</label>
													<input class="form-control" id="wechat" type="text">
												</div>
											</div>
										</div>



									<!--	{if $enable_invite_code == 'true'}  -->
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="code">邀請碼(可選)</label>
														<input class="form-control" id="code" type="text" value="{$code}">
													</div>
												</div>
											</div>
								<!--		{/if}   -->

										{if $geetest_html != null}
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<div id="embed-captcha"></div>
													</div>
												</div>
											</div>
										{/if}

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<button id="tos" type="submit" class="btn btn-block btn-brand waves-attach waves-light">注冊</button>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<p>注冊即代表同意<a href="/tos">服務條款</a>，以及保證所錄入信息的真實性，如有不實信息會導致賬號被刪除。</p>
												</div>
											</div>
										</div>

								</div>
							</div>
						</div>
						<div class="clearfix">
							<p class="margin-no-top pull-left"><a class="btn btn-flat btn-brand waves-attach" href="/auth/login">已經注冊？請登錄</a></p>
						</div>




						{include file='dialog.tpl'}


						<div aria-hidden="true" class="modal modal-va-middle fade" id="tos_modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-heading">
										<h2 class="modal-title">注冊 TOS</h2>
									</div>
									<div class="modal-inner">
										{include file='reg_tos.tpl'}
									</div>
									<div class="modal-footer">
										<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" type="button" id="cancel">我不同意</button>
                                          <button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" id="reg" type="button">我同意</button>
                                      </p>
									</div>
								</div>
							</div>
						</div>

					</section>
				</div>
			</div>
		</div>
	</main>

{include file='footer.tpl'}



<script>
    $(document).ready(function(){
        function register(){

			document.getElementById("tos").disabled = true;

            $.ajax({
                type:"POST",
                url:"/auth/register",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    name: $("#name").val(),
                    passwd: $("#passwd").val(),
                    repasswd: $("#repasswd").val(),
					wechat: $("#wechat").val(),
					imtype: $("#imtype").val(){if $enable_invite_code == 'true'},
					code: $("#code").val(){/if}{if $enable_email_verify == 'true'},
					emailcode: $("#email_code").val(){/if}{if $geetest_html != null},
					geetest_challenge: validate.geetest_challenge,
                    geetest_validate: validate.geetest_validate,
                    geetest_seccode: validate.geetest_seccode
					{/if}
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/auth/login'", {$config['jump_delay']});
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
			document.getElementById("tos").disabled = false;

			{if $geetest_html != null}
			captcha.refresh();
			{/if}
                    }
                },
                error:function(jqXHR){
			$("#msg-error").hide(10);
			$("#msg-error").show(100);
			$("#msg-error-p").html("發生錯誤："+jqXHR.status);
			document.getElementById("tos").disabled = false;
			{if $geetest_html != null}
			captcha.refresh();
			{/if}
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                $("#tos_modal").modal();
            }
        });

		{if $geetest_html != null}
		$('div.modal').on('shown.bs.modal', function() {
			$("div.gt_slider_knob").hide();
		});


		$('div.modal').on('hidden.bs.modal', function() {
			$("div.gt_slider_knob").show();
		});


		{/if}

		$("#reg").click(function(){
            register();
        });

		$("#tos").click(function(){
			{if $geetest_html != null}
			if(typeof validate == 'undefined')
			{
				$("#result").modal();
                $("#msg").html("請滑動驗證碼來完成驗證。");
				return;
			}

			if (!validate) {
				$("#result").modal();
                $("#msg").html("請滑動驗證碼來完成驗證。");
				return;
			}

			{/if}
            $("#tos_modal").modal();
        });
    })
</script>


{if $enable_email_verify == 'true'}
<script>
var wait=60;
function time(o) {
		if (wait == 0) {
			o.removeAttr("disabled");
			o.text("獲取驗證碼");
			wait = 60;
		} else {
			o.attr("disabled","disabled");
			o.text("重新發送(" + wait + ")");
			wait--;
			setTimeout(function() {
				time(o)
			},
			1000)
		}
	}



    $(document).ready(function () {
        $("#email_verify").click(function () {
			time($("#email_verify"));

            $.ajax({
                type: "POST",
                url: "send",
                dataType: "json",
                data: {
                    email: $("#email").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
			$("#msg").html(data.msg);

                    } else {
                        $("#result").modal();
			$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
			$("#msg").html(data.msg+"     出現了一些錯誤。");
                }
            })
        })
    })
</script>
{/if}

{if $geetest_html != null}
<script>
	var handlerEmbed = function (captchaObj) {
        // 將驗證碼加到id爲captcha的元素裏

		captchaObj.onSuccess(function () {
		    validate = captchaObj.getValidate();
		});

		captchaObj.appendTo("#embed-captcha");

		captcha = captchaObj;
		// 更多接口參考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };

	initGeetest({
		gt: "{$geetest_html->gt}",
		challenge: "{$geetest_html->challenge}",
		product: "embed", // 産品形式，包括：float，embed，popup。注意只對PC版驗證碼有效
		offline: {if $geetest_html->success}0{else}1{/if} // 表示用戶後台檢測極驗服務器是否宕機，與SDK配合，用戶一般不需要關注
	}, handlerEmbed);
</script>

{/if}
