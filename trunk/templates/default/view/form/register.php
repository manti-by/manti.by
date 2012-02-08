<?php
    /**
      * @author Alexander Chaika
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */
?>
<script type="text/javascript">
    $(document).ready(function(){
        $('#submit').click(function(e){
            e.preventDefault();
            var email_regex = /^[a-z_0-9\-\.]+@[a-z_0-9\-\.]+\.[a-z]{2,6}$/i;
            
            // reset errors
            $('#register-form input').css('border-color', '#CCC');
            $('#register-form .form_error').hide();
            
            // check fields
            if ($('#email').val() == '') {
                $('#email').css('border-color', 'red');
                $('#email').next('.form_error').html('<?php echo T('Please enter email'); ?>').show();
            } else if (!email_regex.test($('#email').val())) {
                $('#email').css('border-color', 'red');
                $('#email').next('.form_error').html('<?php echo T('It is not valid email address'); ?>').show();
            } else if ($('#password').val() == '') {
                $('#password').css('border-color', 'red');
                $('#password').next('.form_error').html('<?php echo T('Please enter password'); ?>').show();
            } else if ($('#confirm').val() == '') {
                $('#confirm').css('border-color', 'red');
                $('#confirm').next('.form_error').html('<?php echo T('Please reenter password'); ?>').show();
            } else if ($('#password').val() != $('#confirm').val()) {
                $('#confirm').css('border-color', 'red');
                $('#confirm').next('.form_error').html('<?php echo T('Passwords do not match'); ?>').show();
            } else {
                $('#register-form').submit();
                return true;
            }
            return false;
        });
    });
</script>
<form id="register-form" method="POST" action="<?php echo Sef::getSef('index.php'); ?>">
    <input type="hidden" name="module" value="user" />
    <input type="hidden" name="action" value="register" />
    <p class="big">
        <?php echo T('Please enter your personal details below'); ?>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <label for="email"><?php echo T('Email'); ?></label>
        <input type="text" name="email" id="email" value="<?php echo $options['email']; ?>" />
        <span class="form_error"></span>
    </p>
    <p>
        <label for="password"><?php echo T('Password'); ?></label>
        <input type="password" name="password" id="password" value="<?php echo $options['password']; ?>" />
        <span class="form_error"></span>
    </p>
    <p>
        <label for="password"><?php echo T('Retype Password'); ?></label>
        <input type="password" name="confirm" id="confirm" value="<?php echo $options['confirm']; ?>" />
        <span class="form_error"></span>
    </p>
    <p>
        <label for="submit">&nbsp;</label>
        <input type="submit" name="submit" id="submit" value="<?php echo T('Register'); ?>" />
    </p>
    <p>
        <label for="submit">&nbsp;</label>
        <a href="<?php echo Sef::getSef('index.php?module=user&action=loginform'); ?>"><?php echo T('Login'); ?></a>
        <?php echo T('or'); ?>
        <a href="<?php echo Sef::getSef('index.php?module=user&action=forgotform'); ?>"><?php echo T('Forgot password?'); ?></a>
    </p>
</form>

