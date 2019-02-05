Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp4403701ywd;
        Tue, 5 Feb 2019 12:30:53 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaLlkNPm4zYmCcU0QFPtzxgR2AwvcbaprAcnzZzYAWZAQ+Dm6hiiRLaU7+1kHdZUn1w4RKV
X-Received: by 2002:a63:e247:: with SMTP id y7mr6015940pgj.84.1549398653816;
        Tue, 05 Feb 2019 12:30:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549398653; cv=none;
        d=google.com; s=arc-20160816;
        b=LIGsGIFQceyrO7OMp6ItZBAJ+dsuTPXck+tZZYQzF4/YgJLakHIW3SFxGe5e6bGKSx
         Hv80AiABw7Ako+Qj3Ju847L9Adiga2sGildVVrF+TGRuhpxUof9pyCnkGctrP+ZcFnje
         upAU4VNEkr83qROEhf89vuRwbXFt+80sVtfPOH+QyIFuhi80f0MVscB1J5w9ZI6tetTV
         SW85lm77MZsrBjCRem6Hzk1Ty4I2v5vep+iR1TdjidDPO1RqimY2n5A/66HypGIIiGiz
         T5hfm02J4UYQvnyWdYo1bWUkgvVpedwviKpH0X7Ys6XfreB6J26AVz0nBWbNBvUBn82Q
         BC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=xAJ0guu4X+E9bcPggYCbiUdf+c+sIGNJBF6cgKbczIM=;
        b=UH1ymfVlvpXvcETqgIuApaTjfkSo9yIj5C+iHB3wiRSzWQaeMdydvCLYx2dnZ3UnM9
         YwJ4uI74fYEkIOcryjvaD64kfZ92KZ3SDG5eo71z+12esMlyG99fvU/kWNQGjRxJaJKH
         oa1saJIPSC+ANCOlc69PZ4pDe+l9+of/69ORDWh96+P7YBgZmr9crubh9N55J2XrqC/3
         EEoGBJcbqRkJ7LXPyipP+WO5Sb3sl9BLq/FmjjpJZ38ihyiksuFcnK7iXqQ87aGnsPPn
         +C1PMDQX9bXo7ifNa4nX5/Q02k+RR7YZn9pMjfVcXPtAwbyHxhsStnVV1JzIuc7JIMWT
         XjBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id a6si3959118pgc.137.2019.02.05.12.30.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Feb 2019 12:30:53 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B136A8915A;
	Tue,  5 Feb 2019 20:30:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC57E890EE;
 Tue,  5 Feb 2019 20:30:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 15476798-1500050 
 for multiple; Tue, 05 Feb 2019 20:30:35 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix kerneldoc typo for
 intel_vgpu_emulate_hotplug
Date: Tue,  5 Feb 2019 20:30:33 +0000
Message-Id: <20190205203033.5477-1-chris@chris-wilson.co.uk>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYzo0NTc6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2Nvbm5lY3RlZCcgbm90IGRlc2NyaWJlZCBpbiAnaW50ZWxf
dmdwdV9lbXVsYXRlX2hvdHBsdWcnCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmM6
NDU3OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdjb25uY3RlZCcgZGVzY3Jp
cHRpb24gaW4gJ2ludGVsX3ZncHVfZW11bGF0ZV9ob3RwbHVnJwoKRml4ZXM6IDFjYTIwZjMzZGY0
MiAoImRybS9pOTE1L2d2dDogYWRkIGhvdHBsdWcgZW11bGF0aW9uIikKU2lnbmVkLW9mZi1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBIYW5nIFl1YW4gPGhh
bmcueXVhbkBsaW51eC5pbnRlbC5jb20+CkNjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5p
bnRlbC5jb20+CkNjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jCmlu
ZGV4IDAzNTQ3OWUyNzNiZS4uZTNmOWNhYTc4MzlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNw
bGF5LmMKQEAgLTQ0OCw3ICs0NDgsNyBAQCB2b2lkIGludGVsX2d2dF9lbXVsYXRlX3ZibGFuayhz
dHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAvKioKICAqIGludGVsX3ZncHVfZW11bGF0ZV9ob3RwbHVn
IC0gdHJpZ2dlciBob3RwbHVnIGV2ZW50IGZvciB2R1BVCiAgKiBAdmdwdTogYSB2R1BVCi0gKiBA
Y29ubmN0ZWQ6IGxpbmsgc3RhdGUKKyAqIEBjb25uZWN0ZWQ6IGxpbmsgc3RhdGUKICAqCiAgKiBU
aGlzIGZ1bmN0aW9uIGlzIHVzZWQgdG8gdHJpZ2dlciBob3RwbHVnIGludGVycnVwdCBmb3IgdkdQ
VQogICoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2Cg==
