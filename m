Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp3117646ywb;
        Sun, 24 Mar 2019 18:53:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqEEhBSNtHSCFf8x+Ug5J/mU+qY+3qvCilNvW8ZMPLxReLX7lolX2Aua7+bjyow9l1SpZV
X-Received: by 2002:a62:4481:: with SMTP id m1mr21908528pfi.253.1553478787305;
        Sun, 24 Mar 2019 18:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553478787; cv=none;
        d=google.com; s=arc-20160816;
        b=GrFybZPlSt7xMkSq4yo9v/OX++hlbTXv4yXrILl6qgc6wrui3Fzwfwr4rMYVNjklHI
         M6gCK7F1fEw+I6OQ+pRsKJJRA9JT7CQPHOveRkqakkIS3WBrVnF2RHBnw2MaaMIzxh8Y
         zXzv+zw8wKgi2GiiB8GDEGqbPTXNGLotFxf+f6a9PwdXPSVfi1Zv8Mq8II+GiR4xGmyw
         knYJ4UJENhKuiayUNHcdnOUuqZwWdI8xFSfZq2AZo8vEpQcocUdrvHsRgnXz2D7Ss5PV
         nCV3l0LYMBx5vsgwBSJ6012AF6j+CfBpMxpgoUtfLpNPrGpJ7G9mZCo6GFqsmTQvE82r
         U3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=k89G4omyemLDH3ybhsPRsqym0RILW2Uh7UtZR7rixao=;
        b=Q42H0d1Pa8ytSYWf9szO3+PmD1pxlczGJgTJ5pTp2DxZISRlrLoCVXdkHPCGH/N7gG
         nRcCX2st36y/BaXvZlGcTIuUrGd5e9GAdjU4E0E2dVsM84u7kCsL+5kc7D9Xpp8KcKtT
         svKIPiuOILVqrg9+cS5N6apvOv8p3xvKBUl7OYGww1JDo8eHTgXcBD4FAtCQ43H6qqTP
         A2kLrR0p5xYsfCz596d5hlog0MaQCMq3FKZXzABAMKm7e9To+uruUbuFVf4xPbLK6t7s
         ckZi/b+ZYwPsvCouI3on95rl3LvCLKWpdj598pSgXoOIjs/n2fm191zH8ZhrfCpZJgKO
         cIiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 73si12370120pgb.250.2019.03.24.18.53.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2019 18:53:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61296E60A;
	Mon, 25 Mar 2019 01:53:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5B46E60A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Mar 2019 01:53:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Mar 2019 18:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="136943356"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2019 18:53:03 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915/gvt: Add macro define for mmio 0x50080 and
 gvt flip event
Date: Mon, 25 Mar 2019 09:52:15 +0800
Message-Id: <20190325015217.24816-2-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325015217.24816-1-colin.xu@intel.com>
References: <20190325015217.24816-1-colin.xu@intel.com>
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWRkIFNLTF9GTElQX0VWRU5UIHRvIGFkZHJlc3MgaW50byBpbnRlbF9ndnRfZXZlbnRfdHlwZSBm
b3IgcHJpbWFyeQphbmQgc3ByaXRlMCBwbGFuZSBmbGlwIGV2ZW50LgpBZGQgbWFjcm8gdG8gYWRk
cmVzcyBSRUdfNTAwODAgb2Zmc2V0LgoKdjI6CkFkZCBiaXQgb3BlcmF0aW9uIGRlZmluaXRpb24g
Zm9yIGZsaXAgbW9kZS4gKHpoZW55dSkKClNpZ25lZC1vZmYtYnk6IENvbGluIFh1IDxjb2xpbi54
dUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3JlZy5oIHwgMzEgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvcmVnLmggYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvcmVnLmgKaW5kZXggNTZjZmYyMGViYTQ0Li4zZGU1YjY0M2Iy
NjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9yZWcuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvcmVnLmgKQEAgLTYwLDYgKzYwLDM3IEBACiAjZGVmaW5lIF9S
RUdfNzAxQzAocGlwZSwgcGxhbmUpICgweDcwMWMwICsgcGlwZSAqIDB4MTAwMCArIChwbGFuZSAt
IDEpICogMHgxMDApCiAjZGVmaW5lIF9SRUdfNzAxQzQocGlwZSwgcGxhbmUpICgweDcwMWM0ICsg
cGlwZSAqIDB4MTAwMCArIChwbGFuZSAtIDEpICogMHgxMDApCiAKKyNkZWZpbmUgU0tMX0ZMSVBf
RVZFTlQocGlwZSwgcGxhbmUpIChQUklNQVJZX0FfRkxJUF9ET05FICsgKHBsYW5lKSAqIDMgKyAo
cGlwZSkpCisKKyNkZWZpbmUgUExBTkVfQ1RMX0FTWU5DX0ZMSVAJCSgxIDw8IDkpCisjZGVmaW5l
IFJFRzUwMDgwX0ZMSVBfVFlQRV9NQVNLCTB4MworI2RlZmluZSBSRUc1MDA4MF9GTElQX1RZUEVf
QVNZTkMJMHgxCisKKyNkZWZpbmUgUkVHXzUwMDgwKF9waXBlLCBfcGxhbmUpICh7IFwKKwl0eXBl
b2YoX3BpcGUpIChwKSA9IChfcGlwZSk7IFwKKwl0eXBlb2YoX3BsYW5lKSAocSkgPSAoX3BsYW5l
KTsgXAorCSgoKHApID09IFBJUEVfQSkgPyAoKChxKSA9PSBQTEFORV9QUklNQVJZKSA/IChfTU1J
TygweDUwMDgwKSkgOiBcCisJCShfTU1JTygweDUwMDkwKSkpIDogXAorCSgoKHApID09IFBJUEVf
QikgPyAoKChxKSA9PSBQTEFORV9QUklNQVJZKSA/IChfTU1JTygweDUwMDg4KSkgOiBcCisJCShf
TU1JTygweDUwMDk4KSkpIDogXAorCSgoKHApID09IFBJUEVfQykgPyAoKChxKSA9PSBQTEFORV9Q
UklNQVJZKSA/IChfTU1JTygweDUwMDhDKSkgOiBcCisJCShfTU1JTygweDUwMDlDKSkpIDogXAor
CQkoX01NSU8oMHg1MDA4MCkpKSkpOyB9KQorCisjZGVmaW5lIFJFR181MDA4MF9UT19QSVBFKF9y
ZWcpICh7IFwKKwl0eXBlb2YoX3JlZykgKHJlZykgPSAoX3JlZyk7IFwKKwkoKChyZWcpID09IDB4
NTAwODAgfHwgKHJlZykgPT0gMHg1MDA5MCkgPyAoUElQRV9BKSA6IFwKKwkoKChyZWcpID09IDB4
NTAwODggfHwgKHJlZykgPT0gMHg1MDA5OCkgPyAoUElQRV9CKSA6IFwKKwkoKChyZWcpID09IDB4
NTAwOEMgfHwgKHJlZykgPT0gMHg1MDA5QykgPyAoUElQRV9DKSA6IFwKKwkoSU5WQUxJRF9QSVBF
KSkpKTsgfSkKKworI2RlZmluZSBSRUdfNTAwODBfVE9fUExBTkUoX3JlZykgKHsgXAorCXR5cGVv
ZihfcmVnKSAocmVnKSA9IChfcmVnKTsgXAorCSgoKHJlZykgPT0gMHg1MDA4MCB8fCAocmVnKSA9
PSAweDUwMDg4IHx8IChyZWcpID09IDB4NTAwOEMpID8gXAorCQkoUExBTkVfUFJJTUFSWSkgOiBc
CisJKCgocmVnKSA9PSAweDUwMDkwIHx8IChyZWcpID09IDB4NTAwOTggfHwgKHJlZykgPT0gMHg1
MDA5QykgPyBcCisJCShQTEFORV9TUFJJVEUwKSA6IChJOTE1X01BWF9QTEFORVMpKSk7IH0pCisK
ICNkZWZpbmUgR0ZYX01PREVfQklUX1NFVF9JTl9NQVNLKHZhbCwgYml0KSBcCiAJCSgoKChiaXQp
ICYgMHhmZmZmMDAwMCkgPT0gMCkgJiYgISEoKHZhbCkgJiAoKChiaXQpIDw8IDE2KSkpKQogCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
