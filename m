Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1378537ywb;
        Thu, 28 Mar 2019 21:01:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7aW0z5GCapOSMqyHOTyS0vQSJvvM3/Ye0YMMjQ1Ldq/kI17J0Kvi4F48ptaPgdKBs7WCA
X-Received: by 2002:a63:4241:: with SMTP id p62mr26479959pga.379.1553832079857;
        Thu, 28 Mar 2019 21:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553832079; cv=none;
        d=google.com; s=arc-20160816;
        b=Tpdl26PK9Ca0NHfUT+I2CnSE3uK/87qGwN/OjfJBGBmR+d+VtLV/0qvqEXXFAQQWPe
         2Pf0lz2ZSvxHkpxgvY9suLGPJxgtw53v0PtZFQXhQaEZtvxXtOyfxfamxS1zgXSuftLh
         oDVf8Gy8CUCpbiWmwaTEGdrMa0T6YpT7QEV/8xXAZB4cNavH2A1dF0yqXPZlTX7MHuWX
         GX70CVmpPW+UrBfnX4To+Kvuk4bveLdPHXQO+HdSD4yHN2Rt0kWKZUlfleMd0FtiDVaR
         2uZOPlaYyYjHMaR1yLDH2q+QewnVxs964cyBdB+OEiV8O5Y4Ok8IFyhmirFIugB0e5gO
         /L/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=os5TiTPprCEZsyUxtTJN3567HAkzIbKdFo/g6TlrPqw=;
        b=P+TqRAGRsGbu+HN+qt7X6z7Nciyf5iDHV7AEi9k9LOMFA2R3afIVMCwBENffs3HxZZ
         rLuPEhAL26K0wj+j/9gAipeippPU1YOwLalbOhTx9Ie2GQLiL5NEnR+ZaaIK4AQJS2Jf
         u3cBtd+8UUeQdEtRrn38/9uC2xlY2LriezMER2PdXikLxVg3GsY4zitScj7EGDaiFY+U
         hYDsguxlN04v+mQajqDN+3HO0Rh6sxRno+YkUSkE2g68CL8SMwBqfNHhy7ZNW/0mQEkb
         5NAsDnP1jcOEbgP3uIUzYpIdrBBXzlzWQHI+4B7xKTKDG1me2WS8aY5kwtkEup3KBWHN
         /gRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id e26si850525pfi.54.2019.03.28.21.01.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 21:01:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7767A6E819;
	Fri, 29 Mar 2019 04:01:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683CF6E81D;
 Fri, 29 Mar 2019 04:01:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 21:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129648558"
Received: from vca-bj120.bj.intel.com ([10.240.192.119])
 by orsmga008.jf.intel.com with ESMTP; 28 Mar 2019 21:01:16 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 6/8] drm/i915/gvt: GVTg handle shared_page setup
Date: Fri, 29 Mar 2019 09:32:42 -0400
Message-Id: <1553866364-111114-7-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, chris@chris-wilson.co.uk, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

R1ZUZyBpbXBsZW1lbnRlZCBzaGFyZWRfcGFnZSBzZXR1cCBvcGVyYXRpb24gYW5kIHJlYWRfc2hh
cmVkX3BhZ2UKZnVuY3Rpb25hbGl0eSBiYXNlZCBvbiBoeXBlcnZpc29yX3JlYWRfZ3BhKCkuCgp0
aGUgc2hhcmVkX3BhZ2VfZ3BhIHdhcyBwYXNzZWQgZnJvbSBndWVzdCBkcml2ZXIgdGhyb3VnaCBQ
VklORk8Kc2hhcmVkX3BhZ2VfZ3BhIHJlZ2lzdGVyLgoKdjA6IFJGQwp2MTogcmViYXNlCnYyOiBy
ZWJhc2UKdjM6IGFkZGVkIHNoYXJlZF9wYWdlX2dwYSBjaGVjayBhbmQgaWYgcmVhZF9ncGEgZmFp
bHVyZSwgcmV0dXJuIHplcm8KbWVtb3J5IGFuZCBoYW5kbGUgVkdUX0cyVl9TSEFSRURfUEFHRV9T
RVRVUCBnMnYgbm90aWZpY2F0aW9uCnY0OiByZWJhc2UKClNpZ25lZC1vZmYtYnk6IFhpYW9saW4g
WmhhbmcgPHhpYW9saW4uemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndnQuaCAgICAgIHwgIDYgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFu
ZGxlcnMuYyB8IDE1ICsrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Zn
cHUuYyAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndnQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaAppbmRl
eCBhNGZkOTc5Li5iMDFhNTRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3Z0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oCkBAIC00OSw2ICs0OSw3
IEBACiAjaW5jbHVkZSAiZmJfZGVjb2Rlci5oIgogI2luY2x1ZGUgImRtYWJ1Zi5oIgogI2luY2x1
ZGUgInBhZ2VfdHJhY2suaCIKKyNpbmNsdWRlICJpOTE1X3ZncHUuaCIKIAogI2RlZmluZSBHVlRf
TUFYX1ZHUFUgOAogCkBAIC0yMjksNiArMjMwLDggQEAgc3RydWN0IGludGVsX3ZncHUgewogCXN0
cnVjdCBjb21wbGV0aW9uIHZibGFua19kb25lOwogCiAJdTMyIHNjYW5fbm9ucHJpdmJiOworCXU2
NCBzaGFyZWRfcGFnZV9ncGE7CisJYm9vbCBzaGFyZWRfcGFnZV9lbmFibGVkOwogfTsKIAogLyog
dmFsaWRhdGluZyBHTSBoZWFsdGh5IHN0YXR1cyovCkBAIC02ODYsNyArNjg5LDggQEAgaW50IGlu
dGVsX2d2dF9kZWJ1Z2ZzX2FkZF92Z3B1KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KTsKIHZvaWQg
aW50ZWxfZ3Z0X2RlYnVnZnNfcmVtb3ZlX3ZncHUoc3RydWN0IGludGVsX3ZncHUgKnZncHUpOwog
aW50IGludGVsX2d2dF9kZWJ1Z2ZzX2luaXQoc3RydWN0IGludGVsX2d2dCAqZ3Z0KTsKIHZvaWQg
aW50ZWxfZ3Z0X2RlYnVnZnNfY2xlYW4oc3RydWN0IGludGVsX2d2dCAqZ3Z0KTsKLQoraW50IGlu
dGVsX2d2dF9yZWFkX3NoYXJlZF9wYWdlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAorCQl1bnNp
Z25lZCBpbnQgb2Zmc2V0LCB2b2lkICpidWYsIHVuc2lnbmVkIGxvbmcgbGVuKTsKIAogI2luY2x1
ZGUgInRyYWNlLmgiCiAjaW5jbHVkZSAibXB0LmgiCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvaGFuZGxlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVy
cy5jCmluZGV4IDAzMzM2NTIuLjI4YjM5MGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVy
cy5jCkBAIC0xMTY4LDYgKzExNjgsOCBAQCBzdGF0aWMgaW50IHB2aW5mb19tbWlvX3JlYWQoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJY2FzZSAweDc4MDEw
OgkvKiB2Z3RfY2FwcyAqLwogCWNhc2UgMHg3ODgxYzoKIAljYXNlIF92Z3RpZl9yZWcocHZfY2Fw
cyk6CisJY2FzZSBfdmd0aWZfcmVnKHNoYXJlZF9wYWdlX2dwYSk6CisJY2FzZSBfdmd0aWZfcmVn
KHNoYXJlZF9wYWdlX2dwYSkgKyA0OgogCQlicmVhazsKIAlkZWZhdWx0OgogCQlpbnZhbGlkX3Jl
YWQgPSB0cnVlOwpAQCAtMTE4NSw2ICsxMTg3LDcgQEAgc3RhdGljIGludCBoYW5kbGVfZzJ2X25v
dGlmaWNhdGlvbihzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50IG5vdGlmaWNhdGlvbikKIAlp
bnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUgPSBHVFRfVFlQRV9QUEdUVF9ST09U
X0w0X0VOVFJZOwogCXN0cnVjdCBpbnRlbF92Z3B1X21tICptbTsKIAl1NjQgKnBkcHM7CisJdW5z
aWduZWQgbG9uZyBncGEsIGdmbjsKIAogCXBkcHMgPSAodTY0ICopJnZncHVfdnJlZzY0X3Qodmdw
dSwgdmd0aWZfcmVnKHBkcFswXSkpOwogCkBAIC0xMTk4LDYgKzEyMDEsMTYgQEAgc3RhdGljIGlu
dCBoYW5kbGVfZzJ2X25vdGlmaWNhdGlvbihzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50IG5v
dGlmaWNhdGlvbikKIAljYXNlIFZHVF9HMlZfUFBHVFRfTDNfUEFHRV9UQUJMRV9ERVNUUk9ZOgog
CWNhc2UgVkdUX0cyVl9QUEdUVF9MNF9QQUdFX1RBQkxFX0RFU1RST1k6CiAJCXJldHVybiBpbnRl
bF92Z3B1X3B1dF9wcGd0dF9tbSh2Z3B1LCBwZHBzKTsKKwljYXNlIFZHVF9HMlZfU0hBUkVEX1BB
R0VfU0VUVVA6CisJCWdwYSA9IHZncHVfdnJlZzY0X3QodmdwdSwgdmd0aWZfcmVnKHNoYXJlZF9w
YWdlX2dwYSkpOworCQlnZm4gPSBncGEgPj4gUEFHRV9TSElGVDsKKwkJaWYgKCFpbnRlbF9ndnRf
aHlwZXJ2aXNvcl9pc192YWxpZF9nZm4odmdwdSwgZ2ZuKSkgeworCQkJdmdwdV92cmVnX3Qodmdw
dSwgdmd0aWZfcmVnKHB2X2NhcHMpKSA9IDA7CisJCQlyZXR1cm4gMDsKKwkJfQorCQl2Z3B1LT5z
aGFyZWRfcGFnZV9ncGEgPSBncGE7CisJCXZncHUtPnNoYXJlZF9wYWdlX2VuYWJsZWQgPSB0cnVl
OworCQlicmVhazsKIAljYXNlIFZHVF9HMlZfRVhFQ0xJU1RfQ09OVEVYVF9DUkVBVEU6CiAJY2Fz
ZSBWR1RfRzJWX0VYRUNMSVNUX0NPTlRFWFRfREVTVFJPWToKIAljYXNlIDE6CS8qIFJlbW92ZSB0
aGlzIGluIGd1ZXN0IGRyaXZlci4gKi8KQEAgLTEyNTcsNiArMTI3MCw4IEBAIHN0YXRpYyBpbnQg
cHZpbmZvX21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBv
ZmZzZXQsCiAJY2FzZSBfdmd0aWZfcmVnKHBkcFszXS5oaSk6CiAJY2FzZSBfdmd0aWZfcmVnKGV4
ZWNsaXN0X2NvbnRleHRfZGVzY3JpcHRvcl9sbyk6CiAJY2FzZSBfdmd0aWZfcmVnKGV4ZWNsaXN0
X2NvbnRleHRfZGVzY3JpcHRvcl9oaSk6CisJY2FzZSBfdmd0aWZfcmVnKHNoYXJlZF9wYWdlX2dw
YSk6CisJY2FzZSBfdmd0aWZfcmVnKHNoYXJlZF9wYWdlX2dwYSkgKyA0OgogCQlicmVhazsKIAlj
YXNlIF92Z3RpZl9yZWcocnN2NVswXSkuLi5fdmd0aWZfcmVnKHJzdjVbM10pOgogCQllbnRlcl9m
YWlsc2FmZV9tb2RlKHZncHUsIEdWVF9GQUlMU0FGRV9JTlNVRkZJQ0lFTlRfUkVTT1VSQ0UpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC92Z3B1LmMKaW5kZXggOWM5YTE5Mi4uNGQyNDFhNyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvdmdwdS5jCkBAIC02Myw2ICs2Myw4IEBAIHZvaWQgcG9wdWxhdGVfcHZpbmZvX3BhZ2Uo
c3RydWN0IGludGVsX3ZncHUgKnZncHUpCiAJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKGN1
cnNvcl94X2hvdCkpID0gVUlOVF9NQVg7CiAJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKGN1
cnNvcl95X2hvdCkpID0gVUlOVF9NQVg7CiAKKwl2Z3B1X3ZyZWc2NF90KHZncHUsIHZndGlmX3Jl
ZyhzaGFyZWRfcGFnZV9ncGEpKSA9IDA7CisKIAlndnRfZGJnX2NvcmUoIlBvcHVsYXRlIFBWSU5G
TyBQQUdFIGZvciB2R1BVICVkXG4iLCB2Z3B1LT5pZCk7CiAJZ3Z0X2RiZ19jb3JlKCJhcGVydHVy
ZSBiYXNlIFtHTUFEUl0gMHglbGx4IHNpemUgMHglbGx4XG4iLAogCQl2Z3B1X2FwZXJ0dXJlX2dt
YWRyX2Jhc2UodmdwdSksIHZncHVfYXBlcnR1cmVfc3oodmdwdSkpOwpAQCAtNTkzLDMgKzU5NSwy
NSBAQCB2b2lkIGludGVsX2d2dF9yZXNldF92Z3B1KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQog
CWludGVsX2d2dF9yZXNldF92Z3B1X2xvY2tlZCh2Z3B1LCB0cnVlLCAwKTsKIAltdXRleF91bmxv
Y2soJnZncHUtPnZncHVfbG9jayk7CiB9CisKKy8qKgorICogaW50ZWxfZ3Z0X3JlYWRfc2hhcmVk
X3BhZ2UgLSByZWFkIGNvbnRlbnQgZnJvbSBzaGFyZWQgcGFnZQorICovCitpbnQgaW50ZWxfZ3Z0
X3JlYWRfc2hhcmVkX3BhZ2Uoc3RydWN0IGludGVsX3ZncHUgKnZncHUsCisJCXVuc2lnbmVkIGlu
dCBvZmZzZXQsIHZvaWQgKmJ1ZiwgdW5zaWduZWQgbG9uZyBsZW4pCit7CisJaW50IHJldCA9IC1F
SU5WQUw7CisJdW5zaWduZWQgbG9uZyBncGE7CisKKwlpZiAob2Zmc2V0ID49IHNpemVvZihzdHJ1
Y3QgZ3Z0X3NoYXJlZF9wYWdlKSkKKwkJZ290byBlcnI7CisKKwlncGEgPSB2Z3B1LT5zaGFyZWRf
cGFnZV9ncGEgKyBvZmZzZXQ7CisJcmV0ID0gaW50ZWxfZ3Z0X2h5cGVydmlzb3JfcmVhZF9ncGEo
dmdwdSwgZ3BhLCBidWYsIGxlbik7CisJaWYgKCFyZXQpCisJCXJldHVybiByZXQ7CitlcnI6CisJ
Z3Z0X3ZncHVfZXJyKCJyZWFkIHNoYXJlZCBwYWdlIChvZmZzZXQgJXgpIGZhaWxlZCIsIG9mZnNl
dCk7CisJbWVtc2V0KGJ1ZiwgMCwgbGVuKTsKKwlyZXR1cm4gcmV0OworfQotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
