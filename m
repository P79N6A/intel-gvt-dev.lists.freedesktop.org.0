Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2754672ywd;
        Fri, 11 Jan 2019 01:31:26 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7iw4qcKvp279ioZWu6+Rc5n1Nj2BVBXJufA2soMej9Sl2FK+dW+cZ3tUUozujchv6BmYl0
X-Received: by 2002:a63:2849:: with SMTP id o70mr12464295pgo.155.1547199085987;
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547199085; cv=none;
        d=google.com; s=arc-20160816;
        b=yT/JbW8YVk2eJ2QBUNSB3fBZRZJ/H6VFFb30HLGe9eRtMgRyqVq1un2EluUWrLPYiK
         ssZH+CqHfwwhwMlBlT0Bv/+7hiWQxnxYEUZI7m0SVrl59EtCHRiNHyVEbJaeJg9blFQe
         Ce5I19+K3sGAtb0knVMnlfGotme/ZvYm80PWtcSHuRnBMmJWk4VdXqwJwrONFxnDvlfl
         U/ZF6y7mAefFGcvhHMEcC4YHPRh043Mv4q67lde+f/DN0MnY6L1ntGMhp7v6g2XUDkmQ
         6sGhSZhNslxZ2XFpDSmkr5qN7gJEekxA1Mu7ddR9u9oX3umqWJ/FSuL7ik6mOrq/EqWQ
         0xig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=My+cZgytOwjRKLhlsF5l6y3tJsOMR6f+ggnzSOiXDEY=;
        b=hu5RIQxhTrOgG4lhN2R3kA7/fst7X0vRXeH2Rl6Bmi+5NADrlWEzZA7NkK4RLRY/0k
         WAh/FmFR2z8iKeow7Rlo3RzyyUaQFUJBBJ1m0KUpn026Vta00HdGKmJyvHZsTV85kS0C
         cEso+iwiLOpiWXdE+DXIHkKtJTX9GM2EjosOB2zNG0cJtBvpXtmtbRJmE//d0TgRPfHh
         lbi9NlMzF0rtspDNAZQdSexP5kqjsne/jTmprzMMFdNgzm7aahvHUlQk1Wmjgm2HgCQs
         xi8xaPytib60+Z/IIAVPJppw6drD09R+pyE7xMh0I3RMBnd0qqI+QGYSj+TJ3mMH13WL
         U/Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id x33si20793423plb.43.2019.01.11.01.31.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7036F5B6;
	Fri, 11 Jan 2019 09:31:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCBC6F5B3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 049CA356F3;
 Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FBE81F0;
 Fri, 11 Jan 2019 09:31:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D2299AD8; Fri, 11 Jan 2019 10:31:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] vfio/display: add xres + yres properties
Date: Fri, 11 Jan 2019 10:31:14 +0100
Message-Id: <20190111093116.17188-4-kraxel@redhat.com>
In-Reply-To: <20190111093116.17188-1-kraxel@redhat.com>
References: <20190111093116.17188-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBhbGxvd3MgY29uZmlndXJlIHRoZSBkaXNwbGF5IHJlc29sdXRpb24gd2hpY2ggdGhlIHZn
cHUgc2hvdWxkIHVzZS4KVGhlIGluZm9ybWF0aW9uIHdpbGwgYmUgcGFzc2VkIHRvIHRoZSBndWVz
dCB1c2luZyBFRElELCBzbyB0aGUgbWRldgpkcml2ZXIgbXVzdCBzdXBwb3J0IHRoZSB2ZmlvIGVk
aWQgcmVnaW9uIGZvciB0aGlzIHRvIHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBody92ZmlvL3BjaS5oICAgICB8ICAyICsrCiBody92
ZmlvL2Rpc3BsYXkuYyB8IDEwICsrKysrKysrLS0KIGh3L3ZmaW8vcGNpLmMgICAgIHwgIDIgKysK
IDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9ody92ZmlvL3BjaS5oIGIvaHcvdmZpby9wY2kuaAppbmRleCBiMWFlNGMwNzU0Li5j
MTFjM2YxNjcwIDEwMDY0NAotLS0gYS9ody92ZmlvL3BjaS5oCisrKyBiL2h3L3ZmaW8vcGNpLmgK
QEAgLTE0OSw2ICsxNDksOCBAQCB0eXBlZGVmIHN0cnVjdCBWRklPUENJRGV2aWNlIHsKICNkZWZp
bmUgVkZJT19GRUFUVVJFX0VOQUJMRV9JR0RfT1BSRUdJT04gXAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoMSA8PCBWRklPX0ZFQVRVUkVfRU5BQkxFX0lHRF9PUFJFR0lPTl9CSVQp
CiAgICAgT25PZmZBdXRvIGRpc3BsYXk7CisgICAgdWludDMyX3QgZGlzcGxheV94cmVzOworICAg
IHVpbnQzMl90IGRpc3BsYXlfeXJlczsKICAgICBpbnQzMl90IGJvb3RpbmRleDsKICAgICB1aW50
MzJfdCBpZ2RfZ21zOwogICAgIE9mZkF1dG9QQ0lCQVIgbXNpeF9yZWxvOwpkaWZmIC0tZ2l0IGEv
aHcvdmZpby9kaXNwbGF5LmMgYi9ody92ZmlvL2Rpc3BsYXkuYwppbmRleCAwZWY0ZDc3ZTIxLi4z
YTEwMDcyODIzIDEwMDY0NAotLS0gYS9ody92ZmlvL2Rpc3BsYXkuYworKysgYi9ody92ZmlvL2Rp
c3BsYXkuYwpAQCAtNDMsOCArNDMsOCBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF91
cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBlbmFibGVkLCBpbnQgcHJlZgogICAgIHFl
bXVfZWRpZF9pbmZvIGVkaWQgPSB7CiAgICAgICAgIC5tYXh4ICA9IGRweS0+ZWRpZF9yZWdzLT5t
YXhfeHJlcywKICAgICAgICAgLm1heHkgID0gZHB5LT5lZGlkX3JlZ3MtPm1heF95cmVzLAotICAg
ICAgICAucHJlZnggPSBwcmVmeCwKLSAgICAgICAgLnByZWZ5ID0gcHJlZnksCisgICAgICAgIC5w
cmVmeCA9IHByZWZ4ID86IHZkZXYtPmRpc3BsYXlfeHJlcywKKyAgICAgICAgLnByZWZ5ID0gcHJl
ZnkgPzogdmRldi0+ZGlzcGxheV95cmVzLAogICAgIH07CiAKICAgICBkcHktPmVkaWRfcmVncy0+
bGlua19zdGF0ZSA9IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX0RPV047CkBAIC0xMjAsNiAr
MTIwLDEyIEBAIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX2luaXQoVkZJT1BDSURldmlj
ZSAqdmRldikKICAgICBwcmVhZF9maWVsZCh2ZGV2LT52YmFzZWRldi5mZCwgZHB5LT5lZGlkX2lu
Zm8sIGRweS0+ZWRpZF9yZWdzLCBtYXhfeXJlcyk7CiAgICAgZHB5LT5lZGlkX2Jsb2IgPSBnX21h
bGxvYzAoZHB5LT5lZGlkX3JlZ3MtPmVkaWRfbWF4X3NpemUpOwogCisgICAgLyogaWYgeHJlcyAr
IHlyZXMgcHJvcGVydGllcyBhcmUgdW5zZXQgdXNlIHRoZSBtYXhpbXVtIHJlc29sdXRpb24gKi8K
KyAgICBpZiAoIXZkZXYtPmRpc3BsYXlfeHJlcykKKyAgICAgICAgdmRldi0+ZGlzcGxheV94cmVz
ID0gZHB5LT5lZGlkX3JlZ3MtPm1heF94cmVzOworICAgIGlmICghdmRldi0+ZGlzcGxheV95cmVz
KQorICAgICAgICB2ZGV2LT5kaXNwbGF5X3lyZXMgPSBkcHktPmVkaWRfcmVncy0+bWF4X3lyZXM7
CisKICAgICB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUodmRldiwgdHJ1ZSwgMCwgMCk7CiAgICAg
cmV0dXJuOwogCmRpZmYgLS1naXQgYS9ody92ZmlvL3BjaS5jIGIvaHcvdmZpby9wY2kuYwppbmRl
eCBjMGNiMWVjMjg5Li42ZjliNjk5MmZjIDEwMDY0NAotLS0gYS9ody92ZmlvL3BjaS5jCisrKyBi
L2h3L3ZmaW8vcGNpLmMKQEAgLTMxODIsNiArMzE4Miw4IEBAIHN0YXRpYyBQcm9wZXJ0eSB2Zmlv
X3BjaV9kZXZfcHJvcGVydGllc1tdID0gewogICAgIERFRklORV9QUk9QX1NUUklORygic3lzZnNk
ZXYiLCBWRklPUENJRGV2aWNlLCB2YmFzZWRldi5zeXNmc2RldiksCiAgICAgREVGSU5FX1BST1Bf
T05fT0ZGX0FVVE8oImRpc3BsYXkiLCBWRklPUENJRGV2aWNlLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRpc3BsYXksIE9OX09GRl9BVVRPX09GRiksCisgICAgREVGSU5FX1BST1BfVUlO
VDMyKCJ4cmVzIiwgVkZJT1BDSURldmljZSwgZGlzcGxheV94cmVzLCAwKSwKKyAgICBERUZJTkVf
UFJPUF9VSU5UMzIoInlyZXMiLCBWRklPUENJRGV2aWNlLCBkaXNwbGF5X3lyZXMsIDApLAogICAg
IERFRklORV9QUk9QX1VJTlQzMigieC1pbnR4LW1tYXAtdGltZW91dC1tcyIsIFZGSU9QQ0lEZXZp
Y2UsCiAgICAgICAgICAgICAgICAgICAgICAgIGludHgubW1hcF90aW1lb3V0LCAxMTAwKSwKICAg
ICBERUZJTkVfUFJPUF9CSVQoIngtdmdhIiwgVkZJT1BDSURldmljZSwgZmVhdHVyZXMsCi0tIAoy
LjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2Cg==
