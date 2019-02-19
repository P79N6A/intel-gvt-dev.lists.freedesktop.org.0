Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3019076ywa;
        Mon, 18 Feb 2019 23:29:26 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ias951674DCJKHAA52N6SHvDPE//h4DeEPjoTvnunk5Ami8gwcAUn/fhsLx3YHdqb6oEDBB
X-Received: by 2002:a65:424c:: with SMTP id d12mr22724236pgq.126.1550561366234;
        Mon, 18 Feb 2019 23:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550561366; cv=none;
        d=google.com; s=arc-20160816;
        b=t352JnchGEZ5hMNPZHh9Rk47N4LXpHuEScgJXR28WvoicSpgQiM3ZJlreljY3k9IwW
         W+ORrKxB1R/AdMdHGZSElu4JUV+5yN5u0dYICruYof6x12M71xAY8+2W3sqtwdwfaPXe
         y5+S2/4zHW7DNw331LnNzBkCX6RkU9bCYPVmPHf3YpAyuG54iDu+wPLzEHNNlrOuJdOx
         NbGRBM70oaDK5LtXewJaATRLDqIF9ALTvLjSDIIqXz1LnLtgu9o79tjv+vMK9GSyeSW3
         7NAnwsyHsoZLYy0NpLRXj8GInl3NCj3OXJ1Y4SysG40ZSRLp8ld/bwhg5yHMAkOedIxR
         Y5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=Kz6jMvCpj1DNXa5snaTLZKb5IHbtQv3sltkio9b6ofo=;
        b=W0hCAUkvDloWZA1ZD2qhs/XcgOq01Nr30HiuGRghS2UWXa+K57ZVDkgJUD6Wbeh0vS
         c3aY0Qt15wvEVtldzK5M5oRs06dlXbkmA4u75DSVD9DcxB7KZlScVO8oanSU9ylKtcMH
         S39AGu2JDvzXimtUwyNg7HCY4eV0b8u+CyHLyKrNNID+meGeyM4CMHsw0YAu8epkYL/a
         uCExyCC/jzUTx34rgDURCw2Qz69oOptPdJCIb+TWOzzBSduqHJdZrUQ/9b9BNhK9SWYE
         ptVK4VWB17cJzykXKdfQYTm1eTIlnHaTtOR0tbaxG7J76jx5Z91UUUlUZLgEpxXvBGft
         3tVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id y13si12225884pgf.524.2019.02.18.23.29.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:29:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26FC89242;
	Tue, 19 Feb 2019 07:29:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7214989242
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 07:29:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 23:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="276083304"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2019 23:29:23 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	alex.williamson@redhat.com
Subject: [PATCH 2/8] drm/i915/gvt: Apply g2h adjustment during fence mmio
 access
Date: Tue, 19 Feb 2019 02:24:01 -0500
Message-Id: <20190219072401.13642-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219071914.13424-1-yan.y.zhao@intel.com>
References: <20190219071914.13424-1-yan.y.zhao@intel.com>
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
Cc: Yulei Zhang <yulei.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogWXVsZWkgWmhhbmcgPHl1bGVpLnpoYW5nQGludGVsLmNvbT4KCkFwcGx5IHRoZSBndWVz
dCB0byBob3N0IGdtYSBjb252ZXJzaW9uIHdoaWxlIGd1ZXN0IGNvbmZpZyB0aGUKZmVuY2UgbW1p
byByZWdpc3RlcnMgZHVlIHRvIHRoZSBob3N0IGdtYSBjaGFuZ2UgYWZ0ZXIgdGhlIG1pZ3JhdGlv
bi4KClNpZ25lZC1vZmYtYnk6IFl1bGVpIFpoYW5nIDx5dWxlaS56aGFuZ0BpbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2FwZXJ0dXJlX2dtLmMgfCAgNiArKysrLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1cmVfZ20uYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9hcGVydHVyZV9nbS5jCmluZGV4IDM1OWQzN2Q1Yzk1OC4uMTIzYzQ3
NWYyZjZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1cmVfZ20u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1cmVfZ20uYwpAQCAtMTQ2LDgg
KzE0NiwxMCBAQCB2b2lkIGludGVsX3ZncHVfd3JpdGVfZmVuY2Uoc3RydWN0IGludGVsX3ZncHUg
KnZncHUsCiAJSTkxNV9XUklURShmZW5jZV9yZWdfbG8sIDApOwogCVBPU1RJTkdfUkVBRChmZW5j
ZV9yZWdfbG8pOwogCi0JSTkxNV9XUklURShmZW5jZV9yZWdfaGksIHVwcGVyXzMyX2JpdHModmFs
dWUpKTsKLQlJOTE1X1dSSVRFKGZlbmNlX3JlZ19sbywgbG93ZXJfMzJfYml0cyh2YWx1ZSkpOwor
CUk5MTVfV1JJVEUoZmVuY2VfcmVnX2hpLAorCQlpbnRlbF9ndnRfcmVnX2cyaCh2Z3B1LCB1cHBl
cl8zMl9iaXRzKHZhbHVlKSwgMHhGRkZGRjAwMCkpOworCUk5MTVfV1JJVEUoZmVuY2VfcmVnX2xv
LAorCQlpbnRlbF9ndnRfcmVnX2cyaCh2Z3B1LCBsb3dlcl8zMl9iaXRzKHZhbHVlKSwgMHhGRkZG
RjAwMCkpOwogCVBPU1RJTkdfUkVBRChmZW5jZV9yZWdfbG8pOwogfQogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3Z0LmgKaW5kZXggYjRhYjFkYWQwMTQzLi44NjIxZDBmNWZkMjYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3Z0LmgKQEAgLTUzMCw2ICs1MzAsMjAgQEAgaW50IGludGVsX2d2dF9nZ3R0X2luZGV4X2cyaChz
dHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgbG9uZyBnX2luZGV4LAogaW50IGludGVs
X2d2dF9nZ3R0X2gyZ19pbmRleChzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgbG9u
ZyBoX2luZGV4LAogCQkJICAgICB1bnNpZ25lZCBsb25nICpnX2luZGV4KTsKIAorLyogYXBwbHkg
Z3Vlc3QgdG8gaG9zdCBnbWEgY29udmVyc2lvbiBpbiBHTSByZWdpc3RlcnMgc2V0dGluZyAqLwor
c3RhdGljIGlubGluZSB1NjQgaW50ZWxfZ3Z0X3JlZ19nMmgoc3RydWN0IGludGVsX3ZncHUgKnZn
cHUsCisJCXUzMiBhZGRyLCB1MzIgbWFzaykKK3sKKwl1NjQgZ21hOworCisJaWYgKGFkZHIpIHsK
KwkJaW50ZWxfZ3Z0X2dndHRfZ21hZHJfZzJoKHZncHUsCisJCQkJYWRkciAmIG1hc2ssICZnbWEp
OworCQlhZGRyID0gZ21hIHwgKGFkZHIgJiAofm1hc2spKTsKKwl9CisJcmV0dXJuIGFkZHI7Cit9
CisKIHZvaWQgaW50ZWxfdmdwdV9pbml0X2NmZ19zcGFjZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdw
dSwKIAkJYm9vbCBwcmltYXJ5KTsKIHZvaWQgaW50ZWxfdmdwdV9yZXNldF9jZmdfc3BhY2Uoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
