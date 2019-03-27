Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp5493701ywb;
        Tue, 26 Mar 2019 19:38:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqOXVrwkexlUUo4GjSXMqxhadXoUvUahzb7XLv9FGO/OO2tc89SgjnZbzkScMQS+eJ9P7D
X-Received: by 2002:a63:5452:: with SMTP id e18mr32528552pgm.386.1553654317804;
        Tue, 26 Mar 2019 19:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553654317; cv=none;
        d=google.com; s=arc-20160816;
        b=YDwY8Ca8/YabgXj7kAUVUbsU2MOW06Kn1rqDlbYuyXD60wWjAnnW7Y3QMi5GjJpwU/
         BV4sj6wO7kTT1DYrPun6iQCUflDyKReabhXo5gysNzFGhXPHIVoT5CPeEXi86yjiZxJB
         rLrkt25RmsNO2ewD0MQ5CcGYq2LHK99OFQN4rlvA5nSTRIyTDHiLgNMp0k3XPmHOyoum
         tAzeldUWcx6PbaabNBvoe0Ciqpo4FKBB1Qz2FJz9FzikINpXL0L4R/E6cgLzerlfA8lm
         +Vwzw86xUW9MjASjD7O1UM2bgI4xhQ3q+5ih6nO6MkQn0+xqNGfzi1UtGy7Cu5/0vYwl
         SUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=rKzJPpSItrw1K8c8COEGPECRTzeXsMBtPvPkuW5LB5k=;
        b=q+xnOOLlDfPpr9RU50zSggUs8c/MGYTLs7UKrHaE+QkkF8qVpTz/9+DgM/6Zqex7fw
         hJzONHyXeRiL5XXlxIRzDYmPwpxDs5mJOUnLTwe6QX8Kkj6pcr6MKSwYX5QVKI0FOk/L
         tA7mlgOe0uJUbKNrSSKaqRnzrDw6SRXCilO9kus04S4LGQ7e1Lc9J4gn2Oz0Qhp777dI
         0jzTN/58X4ZofdE35WTd86Mh7Esc2vl+tCyzIm+1jMA/BTlGA9kMOkNXxM6yBo0r71zC
         hfhV7taKxsOPG63g3Dam4xtU+sRhMhl2oonC7YEt1QxPokKpS2RTMyyafhGgJiFjiqfw
         01Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id h11si17622663pls.237.2019.03.26.19.38.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2019 19:38:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5DD89FF6;
	Wed, 27 Mar 2019 02:38:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138D889FF6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Mar 2019 02:38:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Mar 2019 19:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,274,1549958400"; d="scan'208";a="137708941"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga007.fm.intel.com with ESMTP; 26 Mar 2019 19:38:34 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: do not let pin count of shadow mm go
 negative
Date: Tue, 26 Mar 2019 22:33:08 -0400
Message-Id: <20190327023308.14627-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

c2hhZG93IG1tJ3MgcGluIGNvdW50IGdvdCBpbmNyZWFzZWQgaW4gd29ya2xvYWQgcHJlcGFyYXRp
b24gcGhhc2UsIHdoaWNoCmlzIGFmdGVyIHdvcmtsb2FkIHNjYW5uaW5nLgppdCB3aWxsIGdldCBk
ZWNyZWFzZWQgaW4gY29tcGxldGVfY3VycmVudF93b3JrbG9hZCgpIGFueXdheSBhZnRlcgp3b3Jr
bG9hZCBjb21wbGV0aW9uLgpTb21ldGltZXMsIGlmIGEgd29ya2xvYWQgbWVldHMgYSBzY2Fubmlu
ZyBlcnJvciwgaXRzIHNoYWRvdyBtbSBwaW4gY291bnQKd2lsbCBub3QgZ2V0IGluY3JlYXNlZCBi
dXQgd2lsbCBnZXQgZGVjcmVhc2VkIGluIHRoZSBlbmQuClRoaXMgcGF0Y2ggbGV0cyBzaGFkb3cg
bW0ncyBwaW4gY291bnQgbm90IGdvIGJlbG93IDAuCgpDYzogemhlbnl1d0BsaW51eC5pbnRlbC5j
b20KU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwppbmRleCBmNGM5
OTJkOTYwODcuLjg4ZWQyZTlkZjI1MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d0dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwpAQCAtMTk0Niw3
ICsxOTQ2LDcgQEAgdm9pZCBfaW50ZWxfdmdwdV9tbV9yZWxlYXNlKHN0cnVjdCBrcmVmICptbV9y
ZWYpCiAgKi8KIHZvaWQgaW50ZWxfdmdwdV91bnBpbl9tbShzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAq
bW0pCiB7Ci0JYXRvbWljX2RlYygmbW0tPnBpbmNvdW50KTsKKwlhdG9taWNfZGVjX2lmX3Bvc2l0
aXZlKCZtbS0+cGluY291bnQpOwogfQogCiAvKioKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
