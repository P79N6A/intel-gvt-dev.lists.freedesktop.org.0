Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1117533ywo;
        Thu, 4 Apr 2019 00:31:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWwpdIQ39JLd+cvzE/gB2DjJcHFdNz9D8U9tVSNnpAn5Edqv/IEnOq8fmtZHLeMQKCpynr
X-Received: by 2002:aa7:9219:: with SMTP id 25mr4220468pfo.205.1554363073249;
        Thu, 04 Apr 2019 00:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554363073; cv=none;
        d=google.com; s=arc-20160816;
        b=YDJ8R/ATdxAi3uMVs1HV1rzMz4RkZTBu8u2CYHnqGCZdwN4UhAKhiRdqYGKlwGnEKS
         TvwcMoSZHd+I4fstEN+Sy89mx1qDACHC64Te3QY/w/3ZXd3aEpXDc/tSYWebPh3Z3+Xh
         0zjUPj5jsbWYer8DfQ2j8E43uoPM6L1mp2Mexhm+p4WoMjuIuDHmpQnG0VTYtoL5MQeZ
         LhpysrfrZtIIfC5/O/QfxPu5wX5sfxtZ5quR7Ctm7n0XowC7gL4Z/P20iloJHALUjSdu
         B4l8iGqwNxMllGaWH8dGxZl2izoR84eIVwQks/AIBKJIMFRRXafrWvoMiz6WMIeupVo1
         BMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=Se7jyeEUGqXMIw3cqddCkN8NLNTJKXBVqc4p6ZdGSKU=;
        b=blCBMyDRScMsFqWbqJO8oGUP8bXO5+isBcm+7lsPdQ6JwJGbTbLM32nw+MpA0aardg
         GeYu5C4iUfQ1D7xhVzOIHK7xEVaF1ZQsr0zcdhh57gLgUnaHMhK40tV9CnLsOYaGRZvJ
         GjyYHsKpUvDZg2PyaLwT5Jd7tIBEbFdMLCWH7nuS/2HKNjD9+8Rtiocdcrh8mvJyMT1s
         tamIOUUMx61hdWjvlAh9Ic74n4ZIdoX9Za9D6Lz6Ci0LRbFPCluXArpPT/r2xFdkdDke
         g5oTB1G+JbJba15ht1slblrP7zZLErmJYrPx/uCc8HOLJpeno0n2JUqfpl3fjb94VW6q
         V4YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 5si233070plc.425.2019.04.04.00.31.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2019 00:31:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2B66E9CD;
	Thu,  4 Apr 2019 07:31:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F30D6E575;
 Thu,  4 Apr 2019 07:31:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 16125475-1500050 
 for multiple; Thu, 04 Apr 2019 08:30:58 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Prevent use-after-free in ppgtt_free_all_spt()
Date: Thu,  4 Apr 2019 08:30:56 +0100
Message-Id: <20190404073056.12407-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
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
Cc: Changbin Du <changbin.du@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

cHBndHRfZnJlZV9hbGxfc3B0KCkgaXRlcmF0ZXMgdGhlIHJhZGl4dHJlZSBhcyBpdCBpcyBkZWxl
dGluZyBpdCwKZm9yZ29pbmcgYWxsIHByb3RlY3Rpb24gYWdhaW5zdCB0aGUgbGVhdmVzIGJlaW5n
IGZyZWVkIGluIHRoZSBwcm9jZXNzCihsZWF2aW5nIHRoZSBpdGVyIHBvaW50aW5nIGludG8gdGhl
IHZvaWQpLgoKQSBtaW5pbWFsIGZpeCBzZWVtcyB0byBiZSB0byB1c2UgdGhlIGF2YWlsYWJsZSBw
b3N0X3NoYWRvd19saXN0IHRvCmRlY29tcG9zZSB0aGUgdHJlZSBpbnRvIGEgbGlzdCBwcmlvciB0
byBkZXN0cm95aW5nIHRoZSByYWRpeHRyZWUuCgpBbGVydGVkIGJ5IHRoZSBzcGFyc2Ugd2Fybmlu
Z3M6Cgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmM6NzU3Ojk6IHdhcm5pbmc6IGluY29y
cmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlcykKZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jOjc1Nzo5OiAgICBleHBlY3RlZCB2b2lkICoqc2xvdApk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmM6NzU3Ojk6ICAgIGdvdCB2b2lkIFtub2RlcmVm
XSA8YXNuOjQ+ICoqCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYzo3NTc6OTogd2Fybmlu
ZzogaW5jb3JyZWN0IHR5cGUgaW4gYXNzaWdubWVudCAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2Vz
KQpkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmM6NzU3Ojk6ICAgIGV4cGVjdGVkIHZvaWQg
KipzbG90CmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYzo3NTc6OTogICAgZ290IHZvaWQg
W25vZGVyZWZdIDxhc246ND4gKioKZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jOjc1ODo0
NTogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMSAoZGlmZmVyZW50IGFkZHJl
c3Mgc3BhY2VzKQpkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmM6NzU4OjQ1OiAgICBleHBl
Y3RlZCB2b2lkIFtub2RlcmVmXSA8YXNuOjQ+ICoqc2xvdApkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmM6NzU4OjQ1OiAgICBnb3Qgdm9pZCAqKnNsb3QKZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d0dC5jOjc1Nzo5OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhcmd1bWVudCAxIChk
aWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYzo3
NTc6OTogICAgZXhwZWN0ZWQgdm9pZCBbbm9kZXJlZl0gPGFzbjo0PiAqKnNsb3QKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jOjc1Nzo5OiAgICBnb3Qgdm9pZCAqKnNsb3QKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jOjc1Nzo5OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBh
c3NpZ25tZW50IChkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpCmRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndHQuYzo3NTc6OTogICAgZXhwZWN0ZWQgdm9pZCAqKnNsb3QKZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jOjc1Nzo5OiAgICBnb3Qgdm9pZCBbbm9kZXJlZl0gPGFzbjo0PiAqKgoK
VGhpcyB3b3VsZCBhbHNvIGhhdmUgYmVlbiBsb3VkbHkgd2FybmluZyBpZiBydW4gdGhyb3VnaCBD
SSBmb3IgdGhlCmludmFsaWQgUkNVIGRlcmVmZXJlbmNlcy4KCkZpeGVzOiBiNmMxMjZhMzkzNDUg
KCJkcm0vaTkxNS9ndnQ6IE1hbmFnZSBzaGFkb3cgcGFnZXMgd2l0aCByYWRpeCB0cmVlIikKU2ln
bmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBD
aGFuZ2JpbiBEdSA8Y2hhbmdiaW4uZHVAaW50ZWwuY29tPgpDYzogWmhlbnl1IFdhbmcgPHpoZW55
dXdAbGludXguaW50ZWwuY29tPgpDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDEyICsrKysrKysrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMKaW5kZXggY2YxMzNlZjAzODczLi45ODE0NzczODgyZWMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMKQEAgLTc1MCwxNCArNzUwLDIwIEBAIHN0YXRpYyB2b2lkIHBwZ3R0X2ZyZWVfc3B0
KHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0KQogCiBzdGF0aWMgdm9pZCBwcGd0dF9m
cmVlX2FsbF9zcHQoc3RydWN0IGludGVsX3ZncHUgKnZncHUpCiB7Ci0Jc3RydWN0IGludGVsX3Zn
cHVfcHBndHRfc3B0ICpzcHQ7CisJc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpzcHQsICpz
cG47CiAJc3RydWN0IHJhZGl4X3RyZWVfaXRlciBpdGVyOwotCXZvaWQgKipzbG90OworCUxJU1Rf
SEVBRChhbGxfc3B0KTsKKwl2b2lkIF9fcmN1ICoqc2xvdDsKIAorCXJjdV9yZWFkX2xvY2soKTsK
IAlyYWRpeF90cmVlX2Zvcl9lYWNoX3Nsb3Qoc2xvdCwgJnZncHUtPmd0dC5zcHRfdHJlZSwgJml0
ZXIsIDApIHsKIAkJc3B0ID0gcmFkaXhfdHJlZV9kZXJlZl9zbG90KHNsb3QpOwotCQlwcGd0dF9m
cmVlX3NwdChzcHQpOworCQlsaXN0X21vdmUoJnNwdC0+cG9zdF9zaGFkb3dfbGlzdCwgJmFsbF9z
cHQpOwogCX0KKwlyY3VfcmVhZF91bmxvY2soKTsKKworCWxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShzcHQsIHNwbiwgJmFsbF9zcHQsIHBvc3Rfc2hhZG93X2xpc3QpCisJCXBwZ3R0X2ZyZWVfc3B0
KHNwdCk7CiB9CiAKIHN0YXRpYyBpbnQgcHBndHRfaGFuZGxlX2d1ZXN0X3dyaXRlX3BhZ2VfdGFi
bGVfYnl0ZXMoCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
