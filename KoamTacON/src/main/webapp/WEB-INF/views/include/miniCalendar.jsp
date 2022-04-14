<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%> --%>
<!DOCTYPE html>
<html>

<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<!-- <title>air datepicker</title> -->
<link rel="stylesheet"
	href="/resources/air-datepicker/dist/css/datepicker.min.css">
<!-- <script src="/resources/air-datepicker/dist/js/jquery-3.1.1.min.js"></script> -->
<script src="/resources/air-datepicker/dist/js/datepicker.min.js"></script>
<script src="/resources/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
<style>
* {
	margin: auto;
	padding: 0;
}

.double div {
	float: left;
	/* width: 10 */
	width: 220px;
	padding: 10px;
/* 	border: 5px solid green; */
	margin: auto;
	display: block;
}


</style>
</head>

<body>

	<!-- <div class="single">
        <h1>1�� ¥��</h1>
        <input id="datepicker" type="text">
    </div>

    <br /><br /><br /> -->
	<cmain> <cdiv class="double"> <input id="datepicker1"
		type="text"> - <input id="datepicker2" type="text"> </cdiv> </cmain>

	<script>
		//�Ѱ��� �ܼ��ϰ� ���鶧
		/*    $("#datepicker").datepicker({
		       language: 'ko'
		   });



		 */

		//�ΰ�¥�� ���� ����Ȱ� ������ִ� �Լ�
		datePickerSet($("#datepicker1"), $("#datepicker2"), true); //������ �����ϴ� �޷� ����, ���޷� 2��°

		/*
		 * �޷� ������
		 * @param sDate �Ķ���͸� ������ 1��¥�� �޷� ����
		 * @example   datePickerSet($("#datepicker"));
		 * 
		 * 
		 * @param sDate, 
		 * @param eDate 2�� ������ ����޷� �����Ǿ� ������ ��¥�� �Ѿ�� ����
		 * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
		 */
		function datePickerSet(sDate, eDate, flag) {

			//���� ~ ���� 2�� ¥�� �޷� datepicker	
			if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
					&& eDate.length > 0) {
				var sDay = sDate.val();
				var eDay = eDate.val();

				if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //ó�� �Է� ��¥ ����, update...			
					var sdp = sDate.datepicker().data("datepicker");
					sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //�ͽ������� �׳� new Date�ϸ� -�� �νĸ��� replace�ʿ�

					var edp = eDate.datepicker().data("datepicker");
					edp.selectDate(new Date(eDay.replace(/-/g, "/"))); //�ͽ������� �׳� new Date�ϸ� -�� �νĸ��� replace�ʿ�
				}

				//�������� �����ϱ� ��¥�� ���°�쿣 ������ ���� ����
				if (!isValidStr(eDay)) {
					sDate.datepicker({
						maxDate : new Date(eDay.replace(/-/g, "/"))
					});
				}
				sDate.datepicker({
					language : 'ko',
					autoClose : true,
					onSelect : function() {
						datePickerSet(sDate, eDate);
					}
				});

				//�������� �����ϱ� ��¥�� ���°�쿣 ������ ���� ����
				if (!isValidStr(sDay)) {
					eDate.datepicker({
						minDate : new Date(sDay.replace(/-/g, "/"))
					});
				}
				eDate.datepicker({
					language : 'ko',
					autoClose : true,
					onSelect : function() {
						datePickerSet(sDate, eDate);
					}
				});

				//�Ѱ�¥�� �޷� datepicker
			} else if (!isValidStr(sDate)) {
				var sDay = sDate.val();
				if (flag && !isValidStr(sDay)) { //ó�� �Է� ��¥ ����, update...			
					var sdp = sDate.datepicker().data("datepicker");
					sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //�ͽ������� �׳� new Date�ϸ� -�� �νĸ��� replace�ʿ�
				}

				sDate.datepicker({
					language : 'ko',
					autoClose : true
				});
			}

			function isValidStr(str) {
				if (str == null || str == undefined || str == "")
					return true;
				else
					return false;
			}
		}
	</script>
</body>

</html>