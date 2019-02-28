Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp332142ywe;
        Thu, 28 Feb 2019 01:56:02 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ0hvilOP7ARnTe1GyMHk/yO+iMGh+UfG8//BE1/bzpDW3Ryqt0ws+og1dHsfMeSLW5nqzW
X-Received: by 2002:a65:438a:: with SMTP id m10mr7626798pgp.191.1551347761916;
        Thu, 28 Feb 2019 01:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551347761; cv=none;
        d=google.com; s=arc-20160816;
        b=mFSiqgCEiJGGjF0tnbrgBZA9HBRf2UbUPKSToQDvRbZJFHMYJ6k3psA9mLIK0bdD8c
         iHqy+LtmPV/OWHZ48H9N215ZNHu3cqS8Ovrac7mxJUuDLdtuNVbveWxt+io2iPH9nGds
         MhfKL9TWqNNwcXAFvOaDzajcUVH9Y/zIPE8j4Dd28ECMZCVsXfHJNUSynIrqrQwfRIsx
         rBnjJGER1qE5mtI1LYVft+vdlIiIVhUYsqJfsYn2XOpNSbFUQP4pI4uRHbR5JM8bObZR
         ZTvZRreX62tQpafvr+M8KgZSrvXlr06aes1SfA79oZx8q+JRMvnp94Fuu3kWbsyT5hmb
         YTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=Cz9J+00DnQSBDCUnpwZdbLaiHwNvCtyG+q1dMoKZhUA=;
        b=QMCkQbebo5ktI/GD0d/b/Xu0x5ECRXPLri+2u+oc+WoLHXeXquxL2ghCiHU7gQhhLv
         zLN5XTsJVfLgzmgUBrAfEoSeFbYDNSGi157c2T8rS9f6Oh3QbyeR8sgOWzs6jxeGlCZQ
         hALaGlI9cSt8oR+u0lTtXktQ9rmIgWuoIHuwtO+l8v6B/DXNDvAK95AEvt+b5njvgvm7
         WA17IeGccLRP91vQaPDdIuuCpV9TOTgbZisAwlHJZ+pSunpGLoXMXLmVWjq9qAcQ/NIL
         JH/V/Fs8PV+NDSKF6k57daV9QtEKB+zFnWMV7KDwTBeiS1gEbEVCn7O588gbWfrjEwj2
         59Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id x6si13058045pgr.372.2019.02.28.01.56.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 01:56:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868226E15E;
	Thu, 28 Feb 2019 09:56:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A916E15E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Feb 2019 09:55:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 01:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,423,1544515200"; d="scan'208";a="130033688"
Received: from debian-nuc.sh.intel.com ([10.239.160.36])
 by orsmga003.jf.intel.com with ESMTP; 28 Feb 2019 01:55:58 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/gvt: Only assign ppgtt root at dispatch time
Date: Thu, 28 Feb 2019 17:55:41 +0800
Message-Id: <20190228095542.23356-2-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228095542.23356-1-zhenyuw@linux.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBtb3ZlcyBwcGd0dCByb290IGhvb2sgb3V0IG9mIHNjYW4gYW5kIHNoYWRvdyBmdW5jdGlv
biwKYXMgaXQncyBvbmx5IHJlcXVpcmVkIGF0IGRpc3BhdGNoIHRpbWUuIEFsc28gbWFrZSBzdXJl
IHRoaXMKY2hlY2tzIGFnYWluc3Qgc2hhZG93IG1tIHRvIGJlIHJlYWR5LCBvdGhlcndpc2UgYmFp
bCBlYXJsaWVyLgoKQ2M6IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4KU2ln
bmVkLW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDE2ICsrKysrKysrKy0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCmluZGV4IDViNTljYmE5ZjkzYS4uZTI4YTNiMzUxM2E0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCkBAIC0zNDYsNyArMzQ2LDcgQEAg
c3RhdGljIGludCBzZXRfY29udGV4dF9wcGd0dF9mcm9tX3NoYWRvdyhzdHJ1Y3QgaW50ZWxfdmdw
dV93b3JrbG9hZCAqd29ya2xvYWQsCiAJaW50IGkgPSAwOwogCiAJaWYgKG1tLT50eXBlICE9IElO
VEVMX0dWVF9NTV9QUEdUVCB8fCAhbW0tPnBwZ3R0X21tLnNoYWRvd2VkKQotCQlyZXR1cm4gLTE7
CisJCXJldHVybiAtRUlOVkFMOwogCiAJaWYgKG1tLT5wcGd0dF9tbS5yb290X2VudHJ5X3R5cGUg
PT0gR1RUX1RZUEVfUFBHVFRfUk9PVF9MNF9FTlRSWSkgewogCQlweF9kbWEoJnBwZ3R0LT5wbWw0
KSA9IG1tLT5wcGd0dF9tbS5zaGFkb3dfcGRwc1swXTsKQEAgLTQxMCwxMiArNDEwLDYgQEAgaW50
IGludGVsX2d2dF9zY2FuX2FuZF9zaGFkb3dfd29ya2xvYWQoc3RydWN0IGludGVsX3ZncHVfd29y
a2xvYWQgKndvcmtsb2FkKQogCWlmICh3b3JrbG9hZC0+c2hhZG93KQogCQlyZXR1cm4gMDsKIAot
CXJldCA9IHNldF9jb250ZXh0X3BwZ3R0X2Zyb21fc2hhZG93KHdvcmtsb2FkLCBzaGFkb3dfY3R4
KTsKLQlpZiAocmV0IDwgMCkgewotCQlndnRfdmdwdV9lcnIoIndvcmtsb2FkIHNoYWRvdyBwcGd0
dCBpc24ndCByZWFkeVxuIik7Ci0JCXJldHVybiByZXQ7Ci0JfQotCiAJLyogcGluIHNoYWRvdyBj
b250ZXh0IGJ5IGd2dCBldmVuIHRoZSBzaGFkb3cgY29udGV4dCB3aWxsIGJlIHBpbm5lZAogCSAq
IHdoZW4gaTkxNSBhbGxvYyByZXF1ZXN0LiBUaGF0IGlzIGJlY2F1c2UgZ3Z0IHdpbGwgdXBkYXRl
IHRoZSBndWVzdAogCSAqIGNvbnRleHQgZnJvbSBzaGFkb3cgY29udGV4dCB3aGVuIHdvcmtsb2Fk
IGlzIGNvbXBsZXRlZCwgYW5kIGF0IHRoYXQKQEAgLTY3OCw2ICs2NzIsOCBAQCBzdGF0aWMgaW50
IGRpc3BhdGNoX3dvcmtsb2FkKHN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCkK
IHsKIAlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IHdvcmtsb2FkLT52Z3B1OwogCXN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHZncHUtPmd2dC0+ZGV2X3ByaXY7CisJc3RydWN0
IGludGVsX3ZncHVfc3VibWlzc2lvbiAqcyA9ICZ2Z3B1LT5zdWJtaXNzaW9uOworCXN0cnVjdCBp
OTE1X2dlbV9jb250ZXh0ICpzaGFkb3dfY3R4ID0gcy0+c2hhZG93X2N0eDsKIAlzdHJ1Y3QgaTkx
NV9yZXF1ZXN0ICpycTsKIAlpbnQgcmluZ19pZCA9IHdvcmtsb2FkLT5yaW5nX2lkOwogCWludCBy
ZXQ7CkBAIC02ODgsNiArNjg0LDEyIEBAIHN0YXRpYyBpbnQgZGlzcGF0Y2hfd29ya2xvYWQoc3Ry
dWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQogCW11dGV4X2xvY2soJnZncHUtPnZn
cHVfbG9jayk7CiAJbXV0ZXhfbG9jaygmZGV2X3ByaXYtPmRybS5zdHJ1Y3RfbXV0ZXgpOwogCisJ
cmV0ID0gc2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3cod29ya2xvYWQsIHNoYWRvd19jdHgp
OworCWlmIChyZXQgPCAwKSB7CisJCWd2dF92Z3B1X2Vycigid29ya2xvYWQgc2hhZG93IHBwZ3R0
IGlzbid0IHJlYWR5XG4iKTsKKwkJZ290byBlcnJfcmVxOworCX0KKwogCXJldCA9IGludGVsX2d2
dF93b3JrbG9hZF9yZXFfYWxsb2Mod29ya2xvYWQpOwogCWlmIChyZXQpCiAJCWdvdG8gZXJyX3Jl
cTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2
