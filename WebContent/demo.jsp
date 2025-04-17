<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waste Process Status Check</title>
    <style>
        * {
            margin: 0;
            box-sizing: border-box;
            padding: 0;
        }
        body {
            height: 100vh;
            display: flex;
            background: rgb(15, 95, 161);
            transition: background 1.2s ease;
            position: relative;
            font-family: 'Raleway', sans-serif;
        }
        input {
            font-size: 1.3em;
        }
        h1 {
            color: white;
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 1.4em;
        }
        .fa-check-circle {
            color: rgb(53, 170, 112)!important;
        }
        .email-field {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            height: 50px;
            width: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 5px;
            transition: all .5s ease;
            padding: 10px;
        }
        .email-field i {
            padding: 10px;
            cursor: pointer;
            font-size: 1.3em;
            color: rgb(126, 126, 131);
        }

        .email-field input {
            color: rgb(126, 126, 131);
            background: none;
            border: none;
            outline: none;
            flex: 1;
            height: 100%;
        }

        div.inactive {
            opacity: 0;
            pointer-events: none;
            transform: translate(-50%, 50%);
        }

        div.active {
            opacity: 1;
            pointer-events: all;
            transform: translate(-50%, -50%);
        }
        body {
            background: url("images/background.jpg");
            background-size: cover;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }

        @keyframes shakeMe {
            0% {
                transform: translate(-50%, -50%) rotate(0deg);
            }
            50% {
                transform: translate(-50%, -50%) rotate(10deg);
            }
            100% {
                transform: translate(-50%, -50%) rotate(0deg);
            }
        }
    </style>
</head>
<body>

<h1>WASTE PROCESS EMPLOYEE REGISTERED STATUS</h1>

<div class="email-field active">
    <i class="fas fa-at"></i>
    <input type="email" placeholder="Email" required>
    <i class="fas fa-arrow-down"></i>
</div>

<script src="https://kit.fontawesome.com/6e358658ed.js" crossorigin="anonymous"></script>
<script>
    function formAnimate() {
        const arrows = document.querySelectorAll('.fa-arrow-down');
        arrows.forEach(arrow => {
            arrow.addEventListener('click', () => {
                const input = arrow.previousElementSibling;
                const parent = arrow.parentElement;

                if (input.type === 'email' && validateEmail(input)) {
                    setTimeout(() => {
                        document.location.href = 'wastelogin.jsp'; 
                    }, 1000); // Adjust delay if needed
                } else {
                    parent.style.animation = 'shakeMe 0.5s ease';
                }

                parent.addEventListener('animationend', () => {
                    parent.style.animation = '';
                })
            });
        });
    }

    function validateEmail(email) {
        const validation = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (validation.test(email.value)) {
            return true;
        } else {
            document.body.style.backgroundColor = 'rgb(189,87,87)';
            setTimeout(function() {
                document.body.style.backgroundColor = 'rgb(15, 95, 161)';
            }, 1200);
            return false;
        }
    }

    formAnimate();
</script>

</body>
</html>
