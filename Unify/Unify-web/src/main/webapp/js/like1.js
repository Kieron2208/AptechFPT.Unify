(function () {
                $(document).ready(function () {
                    var frm = $('#myform55');
                    frm.submit(function () {
                        $.ajax({
                            type: frm.attr('method'),
                            url: frm.attr('action'),
                            data: frm.serialize(),
                            success: function (output) {
                                $("#likecount55").html(output);
                            }
                        });
                        return false;
                    }); 
                });
})();
(function () {
                $(document).ready(function () {
                    var frm = $('#myform54');
                    frm.submit(function () {
                        $.ajax({
                            type: frm.attr('method'),
                            url: frm.attr('action'),
                            data: frm.serialize(),
                            success: function (output) {
                                $("#likecount54").html(output);
                            }
                        });
                        return false;
                    }); 
                });
})();
(function () {
                $(document).ready(function () {
                    var frm = $('#myform53');
                    frm.submit(function () {
                        $.ajax({
                            type: frm.attr('method'),
                            url: frm.attr('action'),
                            data: frm.serialize(),
                            success: function (output) {
                                $("#likecount53").html(output);
                            }
                        });
                        return false;
                    }); 
                });
})();