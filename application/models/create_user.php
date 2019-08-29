<section class="content-header">
    <h1>
        <?php echo strtoupper(lang('create_user_heading'));?>
        <small><?php echo lang('create_user_subheading');?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-suitcase"></i>Seting</a></li>
        <li class="active"><?php echo lang('create_user_heading');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                <div class="col-md-5">
                <?php
                    echo form_open('auth/create_user');
                ?> 
                  <div class="text-red"><?php echo $message;?></div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="example">First Name</label>
                            <input type="text" name="first_name" id="first_name" class="form-control" required oninvalid="setCustomValidity('First Name !')"
                                   oninput="setCustomValidity('')" placeholder="Type Your First Name" >
                        </div>                                           
                        <div class="form-group">
                            <label for="">Last Name</label>
                            <input type="text" class="form-control" name="last_name" id="last_name" required oninvalid="setCustomValidity('Last Name !')"
                                   oninput="setCustomValidity('')" placeholder="Type Your Last Name">
                        </div> 
                         <div class="form-group">
                            <label for="">Username</label>
                            <input type="text" class="form-control" name="username" id="username" required oninvalid="setCustomValidity('Username !')"
                                   oninput="setCustomValidity('')" placeholder="Type username">
                            <?php echo form_error('username', '<div class="text-red">', '</div>'); ?>
                        </div>  
                        <div class="form-group">
                            <label for="">Email</label>
                            <input type="email" class="form-control" name="email" id="email" required oninvalid="setCustomValidity('Email cannot empty or wrong format email !')"
                                   oninput="setCustomValidity('')" placeholder="example@example.com">
                        </div>   
                        <div class="form-group">
                            <label for="">Company Name</label>
                            <input type="text" class="form-control" name="name_toko" id="name_toko" required oninvalid="setCustomValidity('Email cannot empty !')"
                                   oninput="setCustomValidity('')" placeholder="Please type Your email address">
                        </div>  
                        <div class="form-group">
                            <label for="">Password</label>
                            <input type="password" class="form-control" name="password" id="password" required oninvalid="setCustomValidity('Password Empty !')"
                                   oninput="setCustomValidity('')" placeholder="Please type Your Password (min 8 max 20)">
                        </div>  
                        <div class="form-group">
                            <label for="">Password Confirmation</label>
                            <input type="password" class="form-control" name="password_confirm" id="password_confirm" required oninvalid="setCustomValidity('Password cannot be blank !')"
                                   oninput="setCustomValidity('')" placeholder="Password Confirmation">
                        </div>                         
                        <div class="form-group">
                            <label for="">Major Name</label>
                            <select name='major_id' class="form-control ">
                            <option value='0'>-- Select Major --</option>
                                <?php
                                if (!empty($company)) {
                                    foreach ($company as $r) {
                                        echo "<option value=".$r->id.">".$r->company."</option>";
                                    }
                                }
                                ?>
                            </select>
                        </div>
                        
                    </div><!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" name="submit" class="btn btn-primary"><i class="glyphicon glyphicon-hdd"></i> Save</button>                        
                        <a href="javascript:history.back()" class="btn btn-primary">Back</a>
                    </div>
                </form>
                </div>
            </div>
            </div>
        </div>
    </div>
</section>