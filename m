Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp4846216ywo;
        Wed, 17 Apr 2019 03:49:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypaSRWsaqLx8LVPilyvvcDIV6qXCrvIrh5HPR1KJJZZ/fLCVwVZ2giLeCPPyVHu8/0JHcN
X-Received: by 2002:a63:5b24:: with SMTP id p36mr37379005pgb.84.1555498175572;
        Wed, 17 Apr 2019 03:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555498175; cv=none;
        d=google.com; s=arc-20160816;
        b=c3G+7Br/UDVYQw6eWdpK6Nh31ha+UQ3J5n4/dgbA0qtacDigKNjyGbnMkwbblzKUdm
         IYz0PhYYHTHFsbvg+2QQhPkielicetZZ7iCnIC1R9rrFVbZD4cxD24wJup8YgeoYV9XG
         KhOU0WDfe0WVrs+KLoSaI1Ik+mGtKxwYW3avQXfkCFXXWWIf19wptsdGYvK0jffsLYXI
         IBo4ploSGS9X+yvLOBZm1oRunnTGy7jPTWlDzO9moP4d+gprfGjQTgT9OrjqAAZmIvGh
         +iCnEBbY7JpTWXzPVGxWk2R6So9PmRuzIFPFuQnkfBSSik2kA6+9vzLiFBZ6wybcCG0t
         2Eww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=PI846J/Nht82TX4KSxFqMlRMadYv4SRe8ipEjNv50Xg=;
        b=kTtuQMsmzj7LsdL1RlD+VRX/oP2BJwqOYTXQiqKXztQ0kjmFxieI7fTqYK4pcVl64l
         IHaU+UN2XojWg8zugtJ/AyOsxh41zLD+gaZwaZngZ9Sg39NDeJBV9tyEX+m4YRypY4d9
         sT5+1r9URPiVnV43Gt7tKLrl56DlXMhz4pN/hOC+mK7+IfBHODfI3XVlty40lqrnVlrb
         0nUseIPajcBBfhva88fJmsnuf0ptLOVVnbnBdhg1OAcWPyJQ3ZNI8+EA94fTzK6uKbBf
         Bt5dBCR3POZvWyDVokfsedsaOe1KEyW836ZKSYsczcxc6LmWv6Qqn473WSjJ040TbM50
         iBiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id m9si48359167pgv.559.2019.04.17.03.49.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Apr 2019 03:49:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24E76E02D;
	Wed, 17 Apr 2019 10:49:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92126E02D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Apr 2019 10:49:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Apr 2019 03:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,361,1549958400"; d="scan'208";a="224283727"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga001.jf.intel.com with ESMTP; 17 Apr 2019 03:49:31 -0700
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: remove call trace in plane scaling handler
Date: Wed, 17 Apr 2019 18:40:34 +0800
Message-Id: <1555497634-8596-1-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hang Yuan <hang.yuan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgoKT24gZ3Vlc3QgTU1J
TyBhY2Nlc3MgdG8gc2NhbGUgYSBwbGFuZSwgcHJpbnQgbWVzc2FnZSBidXQgbm8KY2FsbCB0cmFj
ZSBkdW1wZWQuCgpTaWduZWQtb2ZmLWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCAzICstLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2hhbmRsZXJzLmMKaW5kZXggMThmMDFlZS4uZDNkNjc4OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTEyOTgsOCArMTI5OCw3IEBAIHN0YXRpYyBpbnQgcGZf
d3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsCiAJaWYgKChvZmZzZXQgPT0gX1BTXzFBX0NU
UkwgfHwgb2Zmc2V0ID09IF9QU18yQV9DVFJMIHx8CiAJICAgb2Zmc2V0ID09IF9QU18xQl9DVFJM
IHx8IG9mZnNldCA9PSBfUFNfMkJfQ1RSTCB8fAogCSAgIG9mZnNldCA9PSBfUFNfMUNfQ1RSTCkg
JiYgKHZhbCAmIFBTX1BMQU5FX1NFTF9NQVNLKSAhPSAwKSB7Ci0JCVdBUk5fT05DRSh0cnVlLCAi
Vk0oJWQpOiBndWVzdCBpcyB0cnlpbmcgdG8gc2NhbGluZyBhIHBsYW5lXG4iLAotCQkJICB2Z3B1
LT5pZCk7CisJCWd2dF92Z3B1X2VycigidW5zdXBwb3J0ZWQgZGlzcGxheSBwbGFuZSBzY2FsaW5n
IG9wZXJhdGlvblxuIik7CiAJCXJldHVybiAwOwogCX0KIAotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
