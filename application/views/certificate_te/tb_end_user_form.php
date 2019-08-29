<section class='content-header'>
    <h1>
        END USER
        <small>End User Form Entry</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Master</a></li>
        <li class='active'>End User Form</li>
    </ol>
</section>        
<section class='content'>
    <div class='row'>
        <!-- left column -->
        <div class='col-md-12'>
            <!-- general form elements -->
            <div class='box box-primary'>
                <div class='box-header'>
                    <div class='col-md-5'>
                        <form action="<?php echo $action; ?>" method="post">
                            <div class='box-body'>
                                <div class='form-group'>Company <?php echo form_error('company') ?>
                                    <input type="text" class="form-control" name="company" id="company" placeholder="Please type of company name" value="<?php echo $company; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Contact Name <?php echo form_error('contact_name') ?>
                                    <input type="text" class="form-control" name="contact_name" id="contact_name" placeholder="Please type of contact name" value="<?php echo $contact_name; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Division <?php echo form_error('division') ?>
                                    <input type="text" class="form-control" name="division" id="division" placeholder="Please type of division" value="<?php echo $division; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Address <?php echo form_error('address') ?>
                                    <textarea class="form-control" id="address" name="address" placeholder="Please type of address" rows="3"><?php echo $address; ?></textarea>
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>City <?php echo form_error('city') ?>
                                    <input type="text" class="form-control" name="city" id="city" placeholder="Please type of city" value="<?php echo $city; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>State Prov <?php echo form_error('state_prov') ?>
                                    <input type="text" class="form-control" name="state_prov" id="state_prov" placeholder="Please type of State Prov" value="<?php echo $division; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Postal Code <?php echo form_error('postal_code') ?>
                                    <input type="text" class="form-control" name="postal_code" id="postal_code" placeholder="Please type of Postal Code" value="<?php echo $postal_code; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Email <?php echo form_error('postal_code') ?>                                                                        
                                    <input class="form-control" type="email" id="email" name="email" placeholder="Please type of email" value="<?php echo $email; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Phone <?php echo form_error('phone') ?>
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="Please type of Phone" value="<?php echo $phone; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Faximile <?php echo form_error('fax') ?>
                                    <input type="text" class="form-control" name="fax" id="fax" placeholder="Please type of Faximile" value="<?php echo $fax; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Mobile <?php echo form_error('mobile') ?>                                                                        
                                    <input class="form-control" type="text" id="mobile" name="mobile" placeholder="Please type of mobile" value="<?php echo $mobile; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Note <?php echo form_error('note') ?>
                                    <textarea class="form-control" id="note" name="note" placeholder="Please type of address" rows="3"><?php echo $note; ?></textarea>
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Major <?php echo form_error('major') ?>
                                    <select name="major_id" id="major_id" class="form-control" > 
                                        <option value="">- Select Major -</option>                               
                                        <?php                                        
                                        if (!empty($end_user)) {
                                            foreach ($end_user as $row) {
                                                if($major_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->company . "</option>";
                                                }else{
                                                    echo "<option value='$row->id'>" . $row->company . "</option>";
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Inspection Schedule <?php echo form_error('inspection_schedule_id') ?>
                                    <select name="inspection_schedule_id" id="inspection_schedule_id" class="form-control" > 
                                        <option value="">- Select Manufacture -</option>                               
                                        <?php                                        
                                        if (!empty($inspection_schedule)) {
                                            foreach ($inspection_schedule as $row) {
                                                if($inspection_schedule_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->schedule . "</option>";
                                                }else{
                                                    echo "<option value='$row->id'>" . $row->schedule . "</option>";
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Unit System <?php echo form_error('unit_system_id') ?>
                                    <select name="unit_system_id" id="unit_system_id" class="form-control" > 
                                        <option value="">- Select Manufacture -</option>                               
                                        <?php                                        
                                        if (!empty($unit_system)) {
                                            foreach ($unit_system as $row) {
                                                if($unit_system_id == $row->id){
                                                    //echo "<option selected='selected' value='$row->id'>" . strtoupper($row->description) . "</option>";
                                                    echo "<option selected='selected' value='$row->id'>" . $row->description . "</option>";
                                                }else{
                                                    //echo "<option value='$row->id'>" . strtoupper($row->description) . "</option>";
                                                    echo "<option value='$row->id'>" . $row->description . "</option>";
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>
                            <div class='box-footer'>
                                <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
                                <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
                                <a href="<?php echo site_url('end_user') ?>" class="btn btn-default">Cancel</a>
                            </div>
                        </form>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</section><!-- /.content -->