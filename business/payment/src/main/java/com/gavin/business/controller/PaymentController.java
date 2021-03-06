package com.gavin.business.controller;

import com.gavin.business.service.PaymentService;
import com.gavin.common.constants.RequestHeaderConstants;
import com.gavin.common.dto.common.PageResult;
import com.gavin.common.dto.payment.PaymentDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@Api(value = "/payments", description = "支付相关API")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @RequestMapping(value = "/payments/user", method = RequestMethod.GET)
    @ApiOperation(value = "分页查询指定用户帐号中所有支付记录")
    public PageResult<PaymentDto> findPaymentsByUserId(
            @ApiParam(name = "x_user_id", value = "用户ID", required = true) @RequestHeader(RequestHeaderConstants.X_USER_ID) String _userId,
            @ApiParam(name = "current_page", value = "当前页") @RequestParam(name = "current_page", defaultValue = "1") Integer _currentPage,
            @ApiParam(name = "page_size", value = "每页显示记录数") @RequestParam(name = "page_size", defaultValue = "10") Integer _pageSize) {
        PageRequest pageRequest = new PageRequest(
                _currentPage - 1,
                _pageSize,
                new Sort(Sort.Direction.ASC, "id"));

        return paymentService.findPaymentsByUserId(_userId, pageRequest);
    }

}
