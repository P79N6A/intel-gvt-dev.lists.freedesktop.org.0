Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1105631ywo;
        Thu, 4 Apr 2019 00:14:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdek+SGF3jVA8AyAa004nvJpSHjl8a1ewCeu5tGcUUDg7lWH0QBPwNmco2fQcW13saF9um
X-Received: by 2002:a63:d1f:: with SMTP id c31mr4159707pgl.353.1554362091335;
        Thu, 04 Apr 2019 00:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554362091; cv=none;
        d=google.com; s=arc-20160816;
        b=0b7MqfEmduMxiXF14tMSfsFQXjlSftKdwPH7IQLpdF8iOStgl1Y9v0UZPipvHOJx+1
         W+zISKLUnNgmg6YZG/SciUkRNgmBxA5w3fIF+rVNQbCcUCxGVXVAICUhxK9uIHX4V8WR
         tnvXYeOBfnpkQTDfXc8ZtfnIPrgs7/WR09FJ/OU1wQXq4O7zIWKZsVFEZq6s/7ECxSce
         fqywcn0g1KlIjhSrmFOuJlinn4vN4e2YpBsI8gF0pS1bqcHfYeug9COJaJQcqKQNiVKS
         aUDr+grkhHJqefzrHoCjgkhGAecc1HB4UZ5keQvSHoFiAQXyG11FOcY4PgkcL4REQJ6J
         bKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=ydSdxoD37EcitGQ9Slka/cfblDKpsLBGB0qec7W41D0=;
        b=Vx+LjVZGmiyNxNB42TGLRwZcF9L2MU0urRYl44GZnWnApoIx2UKBunJItGd0yZTupV
         ZSoBcSK+OQkRua/+Je9V1xYse8LEHggXupOwWRp4rBS/dEkRbPgBDJjryxE9xs05/mvS
         QT1HlZToEefaiJepsb1sHCA3q6h19mfn2zM5N7vP0uZdJD4RBHvC0QNYkE85qVXmzutW
         Qv1GYRgeXDKCyEQHJ89pOz3xRw4YCPZUbCRgjyKg1XqPJdpTbc8duoCH2Axq6NrnsBTW
         Y75MV1HJy7bBARB4iFDAj7SHlgH48jrW9wtu0s933SW5w2jD0xOxTKrRXip/KeOLgquG
         /8Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id t7si15417012plo.163.2019.04.04.00.14.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2019 00:14:51 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16C56E558;
	Thu,  4 Apr 2019 07:14:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133E66E558;
 Thu,  4 Apr 2019 07:14:48 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 16125293-1500050 
 for multiple; Thu, 04 Apr 2019 08:14:27 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Annotate iomem usage
Date: Thu,  4 Apr 2019 08:14:25 +0100
Message-Id: <20190404071425.25847-1-chris@chris-wilson.co.uk>
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

Rml4IHRoZSBzcGFyc2Ugd2FybmluZyBmb3IgYmxpdGhlbHkgdXNpbmcgaW9tZW0gd2l0aCBub3Jt
YWwgbWVtY3B5OgoKZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmM6OTE2OjIxOiB3YXJu
aW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYWRkcmVzcyBzcGFj
ZXMpCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jOjkxNjoyMTogICAgZXhwZWN0ZWQg
dm9pZCAqYXBlcnR1cmVfdmEKZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmM6OTE2OjIx
OiAgICBnb3Qgdm9pZCBbbm9kZXJlZl0gPGFzbjoyPiAqCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9rdm1ndC5jOjkyNzoyNjogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMSAo
ZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKQpkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3Qu
Yzo5Mjc6MjY6ICAgIGV4cGVjdGVkIHZvaWQgW25vZGVyZWZdIDxhc246Mj4gKnZhZGRyCmRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jOjkyNzoyNjogICAgZ290IHZvaWQgKmFwZXJ0dXJl
X3ZhCgpGaXhlczogZDQ4MGIyOGE0MWE2ICgiZHJtL2k5MTUvZ3Z0OiBGaXggYXBlcnR1cmUgcmVh
ZC93cml0ZSBlbXVsYXRpb24gd2hlbiBlbmFibGUgeC1uby1tbWFwPW9uIikKU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBaaGVueXUgV2Fu
ZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+CkNjOiBDaGFuZ2JpbiBEdSA8Y2hhbmdiaW4uZHVA
aW50ZWwuY29tPgpDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwpp
bmRleCBkNWZjYzQ0N2QyMmYuLmE2OGFkZGY5NWMyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0
LmMKQEAgLTkwNSw3ICs5MDUsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaW50ZWxfdmdwdV9pbl9h
cGVydHVyZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdTY0IG9mZikKIHN0YXRpYyBpbnQgaW50
ZWxfdmdwdV9hcGVydHVyZV9ydyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdTY0IG9mZiwKIAkJ
dm9pZCAqYnVmLCB1bnNpZ25lZCBsb25nIGNvdW50LCBib29sIGlzX3dyaXRlKQogewotCXZvaWQg
KmFwZXJ0dXJlX3ZhOworCXZvaWQgX19pb21lbSAqYXBlcnR1cmVfdmE7CiAKIAlpZiAoIWludGVs
X3ZncHVfaW5fYXBlcnR1cmUodmdwdSwgb2ZmKSB8fAogCSAgICAhaW50ZWxfdmdwdV9pbl9hcGVy
dHVyZSh2Z3B1LCBvZmYgKyBjb3VudCkpIHsKQEAgLTkyMCw5ICs5MjAsOSBAQCBzdGF0aWMgaW50
IGludGVsX3ZncHVfYXBlcnR1cmVfcncoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHU2NCBvZmYs
CiAJCXJldHVybiAtRUlPOwogCiAJaWYgKGlzX3dyaXRlKQotCQltZW1jcHkoYXBlcnR1cmVfdmEg
KyBvZmZzZXRfaW5fcGFnZShvZmYpLCBidWYsIGNvdW50KTsKKwkJbWVtY3B5X3RvaW8oYXBlcnR1
cmVfdmEgKyBvZmZzZXRfaW5fcGFnZShvZmYpLCBidWYsIGNvdW50KTsKIAllbHNlCi0JCW1lbWNw
eShidWYsIGFwZXJ0dXJlX3ZhICsgb2Zmc2V0X2luX3BhZ2Uob2ZmKSwgY291bnQpOworCQltZW1j
cHlfZnJvbWlvKGJ1ZiwgYXBlcnR1cmVfdmEgKyBvZmZzZXRfaW5fcGFnZShvZmYpLCBjb3VudCk7
CiAKIAlpb19tYXBwaW5nX3VubWFwKGFwZXJ0dXJlX3ZhKTsKIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
