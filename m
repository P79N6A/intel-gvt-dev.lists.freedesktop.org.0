Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp5309454ywo;
        Tue, 9 Apr 2019 21:13:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0scfwnRh2LgjoQhb7etdK0blYmiDzx21hoGnTcJIfaSueSLQUApwJJxaCP8+wy9MDLBm8
X-Received: by 2002:a62:5a42:: with SMTP id o63mr41538229pfb.170.1554869588832;
        Tue, 09 Apr 2019 21:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554869588; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQnMcjZELGZBVmWOmod+dsLjHUtn50K/teY62JFGSVSttK+eFKP19hyq23W5Etkvj6
         CmFPgwtORurVeLwlo4YN9UShk20SvyeiJUs1ed6Ap+u6/ZEFq2eE83NWLKEUMk5us7cG
         7cqvAsXWVp62FoJJ62r3b6ctjuzNREhNRNcqWNjrAZReHyFeQo/6Ut2W22EPRPHcaINu
         wX16t+UccSRUuIm80rO/1Cyrp7tw6uWcKEqoqhxL91ixUDJFqVHX6ZNVyhNJf6ZyQh/L
         5MOLEJlYXf5wrYnI2hIVz6VEp1546/YOAXaVv/RK4yVLSiYUwTZ16DG9LNqBgsllfYGR
         McDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=iQ93ikF1sW5FCsqINMEoPU8DHtaFMAerTOs7qM1TskE=;
        b=SLZPPl8/jzLunfS2agX/u5VY1vrD2PQ3SYlG9ZzLrRApqdjRBkl4sfncaSAcOEhvr2
         J19AQUiiy9Vu7IcDfRpL+oKSnVSZEiVNbb2uqM6caA7dW7bOcUV9w/wgThuu4zriumJQ
         oe+qTwRK6132MXUkQXLC334h4VyifmawDGSIyDxFMV3nVNZaD5OxEVA9gHyH41Tt6qCO
         Z/ZnrWvHpvyRIO9pQencibeYOMXfKSzO+M7bC+NdXrQAfjuKmLOsWx7AYuheneCyAvyt
         UIdWqKqXHw5b9Oy3s7nG5El8fbQpxE3wUsUz5HVI3vp+aw/5h0l89k2gmsnO1QisbjVQ
         R5bA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id t16si23277040pgu.344.2019.04.09.21.13.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2019 21:13:08 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D5D89292;
	Wed, 10 Apr 2019 04:13:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ADD89292
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 10 Apr 2019 04:13:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Apr 2019 21:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,332,1549958400"; d="scan'208";a="162930727"
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2019 21:13:06 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/gvt: Change fb_info->size from pages to bytes
Date: Wed, 10 Apr 2019 12:16:34 +0800
Message-Id: <1554869794-5196-2-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554869794-5196-1-git-send-email-xiong.y.zhang@intel.com>
References: <1554869794-5196-1-git-send-email-xiong.y.zhang@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ZmJfaW5mby0+c2l6ZSBpcyBpbiBwYWdlcywgYnV0IHNvbWUgZnVuY3Rpb24gbmVlZCBieXRlcyB3
aGVuIGl0CmlzIGFzIGEgcGFyYW1ldGVyLiBTdWNoIGFzOgphLiBpbnRlbF9ndnRfZ2d0dF92YWxp
ZGF0ZV9yYW5nZSgpLCBhY2NvcmRpbmcgdG8gZnVuY3Rpb24gZGVmaW5pdGlvbgpiLiB2aWZpb19k
ZXZpY2VfZ2Z4X3BsYW5lX2luZm8tPnNpemUsIGFjY29yZGluZyB0byB0aGUgY29tbWVudCBvZgog
ICBpdHMgZGVmaW5pdGlvbgoKU28gY2hhbmdlIGZiX2luZm8tPnNpemUgaW50byBieXRlcy4KCnYy
OiBLZWVwIGZiX2luZm8tPnNpemUgaW4gcmVhbCBzaXplIGluc3RlYWQgb2YgYXNzaW5naW5nIGNh
c3RlZCBwYWdlCiAgICBzaXplKHpoZW55dSkKdjM6IG9iai0+c2l6ZSBzaG91bGQgYmUgcGFnZSBh
bGlnbmVkIGFuZCBkZWxldGUgcmVkdW5kYW50IGNoZWNrKHpoZW55dSkKClNpZ25lZC1vZmYtYnk6
IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFpoZW55
dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZG1hYnVmLmMgfCAxNyArKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5j
CmluZGV4IDRlMWU0MjUuLmMxMDRmMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9kbWFidWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKQEAg
LTQ1LDYgKzQ1LDcgQEAgc3RhdGljIGludCB2Z3B1X2dlbV9nZXRfcGFnZXMoCiAJaW50IGksIHJl
dDsKIAlnZW44X3B0ZV90IF9faW9tZW0gKmd0dF9lbnRyaWVzOwogCXN0cnVjdCBpbnRlbF92Z3B1
X2ZiX2luZm8gKmZiX2luZm87CisJdTMyIHBhZ2VfbnVtOwogCiAJZmJfaW5mbyA9IChzdHJ1Y3Qg
aW50ZWxfdmdwdV9mYl9pbmZvICopb2JqLT5ndnRfaW5mbzsKIAlpZiAoV0FSTl9PTighZmJfaW5m
bykpCkBAIC01NCwxNCArNTUsMTUgQEAgc3RhdGljIGludCB2Z3B1X2dlbV9nZXRfcGFnZXMoCiAJ
aWYgKHVubGlrZWx5KCFzdCkpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcmV0ID0gc2dfYWxsb2Nf
dGFibGUoc3QsIGZiX2luZm8tPnNpemUsIEdGUF9LRVJORUwpOworCXBhZ2VfbnVtID0gb2JqLT5i
YXNlLnNpemUgPj4gUEFHRV9TSElGVDsKKwlyZXQgPSBzZ19hbGxvY190YWJsZShzdCwgcGFnZV9u
dW0sIEdGUF9LRVJORUwpOwogCWlmIChyZXQpIHsKIAkJa2ZyZWUoc3QpOwogCQlyZXR1cm4gcmV0
OwogCX0KIAlndHRfZW50cmllcyA9IChnZW44X3B0ZV90IF9faW9tZW0gKilkZXZfcHJpdi0+Z2d0
dC5nc20gKwogCQkoZmJfaW5mby0+c3RhcnQgPj4gUEFHRV9TSElGVCk7Ci0JZm9yX2VhY2hfc2co
c3QtPnNnbCwgc2csIGZiX2luZm8tPnNpemUsIGkpIHsKKwlmb3JfZWFjaF9zZyhzdC0+c2dsLCBz
ZywgcGFnZV9udW0sIGkpIHsKIAkJc2ctPm9mZnNldCA9IDA7CiAJCXNnLT5sZW5ndGggPSBQQUdF
X1NJWkU7CiAJCXNnX2RtYV9hZGRyZXNzKHNnKSA9CkBAIC0xNTgsNyArMTYwLDcgQEAgc3RhdGlj
IHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICp2Z3B1X2NyZWF0ZV9nZW0oc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKIAkJcmV0dXJuIE5VTEw7CiAKIAlkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2lu
aXQoZGV2LCAmb2JqLT5iYXNlLAotCQlpbmZvLT5zaXplIDw8IFBBR0VfU0hJRlQpOworCQlyb3Vu
ZHVwKGluZm8tPnNpemUsIFBBR0VfU0laRSkpOwogCWk5MTVfZ2VtX29iamVjdF9pbml0KG9iaiwg
JmludGVsX3ZncHVfZ2VtX29wcyk7CiAKIAlvYmotPnJlYWRfZG9tYWlucyA9IEk5MTVfR0VNX0RP
TUFJTl9HVFQ7CkBAIC0yMDYsNyArMjA4LDYgQEAgc3RhdGljIGludCB2Z3B1X2dldF9wbGFuZV9p
bmZvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCXN0cnVjdCBpbnRlbF92Z3B1X2ZiX2luZm8g
KmluZm8sCiAJCWludCBwbGFuZV9pZCkKIHsKLQlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2
X3ByaXYgPSB0b19pOTE1KGRldik7CiAJc3RydWN0IGludGVsX3ZncHVfcHJpbWFyeV9wbGFuZV9m
b3JtYXQgcDsKIAlzdHJ1Y3QgaW50ZWxfdmdwdV9jdXJzb3JfcGxhbmVfZm9ybWF0IGM7CiAJaW50
IHJldCwgdGlsZV9oZWlnaHQgPSAxOwpAQCAtMjY3LDggKzI2OCw3IEBAIHN0YXRpYyBpbnQgdmdw
dV9nZXRfcGxhbmVfaW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1cm4gLUVJTlZB
TDsKIAl9CiAKLQlpbmZvLT5zaXplID0gKGluZm8tPnN0cmlkZSAqIHJvdW5kdXAoaW5mby0+aGVp
Z2h0LCB0aWxlX2hlaWdodCkKLQkJICAgICAgKyBQQUdFX1NJWkUgLSAxKSA+PiBQQUdFX1NISUZU
OworCWluZm8tPnNpemUgPSBpbmZvLT5zdHJpZGUgKiByb3VuZHVwKGluZm8tPmhlaWdodCwgdGls
ZV9oZWlnaHQpOwogCWlmIChpbmZvLT5zaXplID09IDApIHsKIAkJZ3Z0X3ZncHVfZXJyKCJmYiBz
aXplIGlzIHplcm9cbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKQEAgLTI3OCwxMSArMjc4LDYgQEAg
c3RhdGljIGludCB2Z3B1X2dldF9wbGFuZV9pbmZvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJ
CWd2dF92Z3B1X2VycigiTm90IGFsaWduZWQgZmIgYWRkcmVzczoweCVsbHhcbiIsIGluZm8tPnN0
YXJ0KTsKIAkJcmV0dXJuIC1FRkFVTFQ7CiAJfQotCWlmICgoKGluZm8tPnN0YXJ0ID4+IFBBR0Vf
U0hJRlQpICsgaW5mby0+c2l6ZSkgPgotCQlnZ3R0X3RvdGFsX2VudHJpZXMoJmRldl9wcml2LT5n
Z3R0KSkgewotCQlndnRfdmdwdV9lcnIoIkludmFsaWQgR1RUIG9mZnNldCBvciBzaXplXG4iKTsK
LQkJcmV0dXJuIC1FRkFVTFQ7Ci0JfQogCiAJaWYgKCFpbnRlbF9ndnRfZ2d0dF92YWxpZGF0ZV9y
YW5nZSh2Z3B1LCBpbmZvLT5zdGFydCwgaW5mby0+c2l6ZSkpIHsKIAkJZ3Z0X3ZncHVfZXJyKCJp
bnZhbGlkIGdtYSBhZGRyXG4iKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
