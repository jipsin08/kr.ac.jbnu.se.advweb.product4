<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="album text-muted">
		<div class="container">

			<div class="row">
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> VideoURL_ex
						</span>
						<iframe width="auto" height="280"
							src="https://www.youtube.com/embed/r5e_Kfis508" frameborder="0"
							allowfullscreen></iframe>

					</div>
					<p></p>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> URL_ex </span> <img
							alt="Responsive image"
							src="https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-1/p160x160/16830719_997583997040323_2984424931716727767_n.jpg?oh=b34872f25dfa3d2f123becc64eaae59b&oe=5AA2B350"
							style="height: 280px; width: auto;" class="img-thumbnail">
					</div>
					<p></p>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> Video_ex </span>
						<video controls height="280" src="video/bandicam.mp4" width="auto"
							controls="controls"></video>

					</div>
					<p></p>
				</div>

			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> Mango_img </span>
						<img alt="Responsive image" src="image/mango.jpg"
							style="height: 280px; width: auto;" class="img-thumbnail">
					</div>
					<p></p>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> Orange_img
						</span> <img alt="Responsive image" src="image/orange.jpg"
							style="height: 280px; width: auto;" class="img-thumbnail">

					</div>
					<p></p>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> Peach_img </span>
						<img alt="Responsive image" src="image/peach.jpg"
							style="height: 280px; width: auto;" class="img-thumbnail">
					</div>
					<p></p>
				</div>

			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> Pear_img </span> <img
							alt="Responsive image" src="image/pear.jpg"
							style="height: 280px; width: auto;" class="img-thumbnail">
					</div>
					<p></p>
				</div>

				<div class="col-sm-4">
					<div class="card">
						<span style="font-weight: bold; color: black;"> Kiwi_img </span> <img
							alt="Responsive image" src="image/kiwi.jpg"
							style="height: 280px; width: auto;" class="img-thumbnail">
					</div>
					<p></p>
				</div>
			</div>
		</div>

		<div>
			<div class="container">
				<div class="modal fade" id="showContent" tabindex="-1" role="dialog"
					aria-labelleby="showContentLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<label class="modal-title" id="contentNameLabel">hi</label>
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">X</span> <span class="sr-only">Close</span>
								</button>
							</div>

							<div class="modal-body">
								<div class="left col-m-8">
									<img width="auto" height="auto" alt="Responsive image"
										src="https://img.wikinut.com/img/gycf69_-6rv_5fol/jpeg/0/Best-Friends-Img-Src%3AImage%3A-FreeDigitalPhotos.net.jpeg">
								</div>

								<div class="right col-m-4">
									<table>
										<c:forEach items="${replyList}" var="replies">
											<tr>
												<td>${replies.reply}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function() {
				$('#showContent').on('show.bs.modal', function(event) {
					var card = $(event.relatedTarget);
					var recipient = card.data('whatever');
					var modal = $(this);
					modal.find('.modal-title').text(recipient);
				});
			});
		</script>
</body>
</html>