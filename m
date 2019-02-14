Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp601359ywa;
        Thu, 14 Feb 2019 00:52:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib4+teha8mIfN917LJi0z1xwBJfWzEXj1m/MMRQQzGlY+IqzLVVfPisLHMGNXuWxUDdVkO5
X-Received: by 2002:a17:902:7e4c:: with SMTP id a12mr2979656pln.340.1550134371019;
        Thu, 14 Feb 2019 00:52:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550134371; cv=none;
        d=google.com; s=arc-20160816;
        b=wBt6hcUKMDd3spEJlHGOMjeP1MyQUiCdEabwvsmOo/287BNoUJkZLXYa4m0ryDCkMs
         CEQZFfZ8LT66uuYSsd4+tEpGs7TXX6fwaAOa4zWBsh9ugG7TR/KX3f3TDUqGMP+vhx/Y
         3fbra9lR9VAqfjjz5FjMpimJZKJQJYw9YfXfVGQFUu7IQTkDViHjS7Qd7UkyG9034Hni
         Yxd8Ez7ecGzbPZWA4sddEFmuUP0h2pl8a8TTRjnP9/8rb8WFJBhPcMxHPqGpmYbuXf8M
         NMnAmENU7/G6obFDrhbasd95honJ1jExMTHTG5keeDPV/5lfHtxaPE9u+dHaE2k4dmM2
         Urbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=GEoSFqHN2WzLNSYmvKPR/T5GO/u78Flev/QRQbEE1gk=;
        b=DrV3rHdhoB04iMBFHqtTXVuHO5x7+pAlu66jbxUdgXIOHUNmLD/zaHS/3qKLaFocbM
         XQgfTA6bOkpTihZ0p87ETN1pZplYDejXe+xGNCtxBnXFRlDIxAZckSYfh7nZ7DEw4mC+
         IkXEe2eD00BNAnNcx/M+Y7nX88MGb1wWgtTbvMSnvnlPMzHsdCwXhDeH5aIr4Ndyvzrp
         sWgBS06p59x4Bae+KX+rEm5FZccotI/5NecSb71+8wIQFrKZU1QyD+1Al+9yU/R0hwNT
         I7WQJjsUpzEo6l+MhSGmg4l6isfj5cGYyyRuYrayUFGfu4aC3QE5RiMFe2TiAztmOBjx
         Wouw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id v5si1883631plg.318.2019.02.14.00.52.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Feb 2019 00:52:51 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7476E37F;
	Thu, 14 Feb 2019 08:52:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DD26E37F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 14 Feb 2019 08:52:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2019 00:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,368,1544515200"; d="scan'208";a="318928906"
Received: from genxtest-ykzhao.sh.intel.com ([10.239.143.71])
 by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2019 00:52:46 -0800
From: Zhao Yakui <yakui.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: Refine the snapshort range of I915 MCHBAR
 to optimize gvt-g boot time
Date: Thu, 14 Feb 2019 17:09:16 +0800
Message-Id: <1550135357-30932-1-git-send-email-yakui.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Zhao Yakui <yakui.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Q3VycmVudGx5IGl0IHdpbGwgdGFrZSB0aGUgc25hcHNob3Qgb2YgdGhlIE1DSEJBUiByZWdpc3Rl
cnMgZm9yIGd2dC1nCmluaXRpYWxpemF0aW9uIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgZm9yIGd1
ZXN0IHZncHUuIEFuZCBpdCB3aWxsIGNvdmVyCmZyb20gMHgxNDAwMDAgdG8gMHgxN2ZmZmYuIElu
IGZhY3QgYmFzZWQgb24gdGhlIEhXIHNwZWMgbW9zdCBvZiB0aGVtIGFyZQptZWFubGluZ2xlc3Mg
YW5kIHNvbWUgdGltZSBpcyB3YXN0ZWQgdG8gcmVhZCB0aGVzZSByZWdpc3Rlci4KT25seSB0aGUg
cmFuZ2Ugb2YgMHgxNDQwMDAgdG8gMHgxNDdmZmYgY29udGFpbnMgdGhlIHZhbGlkIGRlZmluaXRp
b24uClNvIHRoZSByYW5nZSBvZiBjYXB0dXJpbmcgSTkxNSBNQ0hCQVIgcmVnaXN0ZXIgaXMgcmVm
aW5lZCwgd2hpY2ggaGVscHMKdG8gb3B0aW1pemUgdGhlIGd2dC1nIGJvb3QgdGltZS4KClNpZ25l
ZC1vZmYtYnk6IFpoYW8gWWFrdWkgPHlha3VpLnpoYW9AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMu
YwppbmRleCBiYzY0YjgxLi4wODc3Njc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMu
YwpAQCAtNDcsNiArNDcsOCBAQAogI2RlZmluZSBQQ0hfUFBfT0ZGX0RFTEFZUyBfTU1JTygweGM3
MjBjKQogI2RlZmluZSBQQ0hfUFBfRElWSVNPUiBfTU1JTygweGM3MjEwKQogCisjZGVmaW5lIE1D
SEJBUl9NRU1fQkFTRQkJX01NSU8oTUNIQkFSX01JUlJPUl9CQVNFX1NOQiArIDB4NDAwMCkKKwog
dW5zaWduZWQgbG9uZyBpbnRlbF9ndnRfZ2V0X2RldmljZV90eXBlKHN0cnVjdCBpbnRlbF9ndnQg
Kmd2dCkKIHsKIAlpZiAoSVNfQlJPQURXRUxMKGd2dC0+ZGV2X3ByaXYpKQpAQCAtMzI2NSw3ICsz
MjY3LDcgQEAgdm9pZCBpbnRlbF9ndnRfY2xlYW5fbW1pb19pbmZvKHN0cnVjdCBpbnRlbF9ndnQg
Kmd2dCkKIC8qIFNwZWNpYWwgTU1JTyBibG9ja3MuICovCiBzdGF0aWMgc3RydWN0IGd2dF9tbWlv
X2Jsb2NrIG1taW9fYmxvY2tzW10gPSB7CiAJe0RfU0tMX1BMVVMsIF9NTUlPKENTUl9NTUlPX1NU
QVJUX1JBTkdFKSwgMHgzMDAwLCBOVUxMLCBOVUxMfSwKLQl7RF9BTEwsIF9NTUlPKE1DSEJBUl9N
SVJST1JfQkFTRV9TTkIpLCAweDQwMDAwLCBOVUxMLCBOVUxMfSwKKwl7RF9BTEwsIE1DSEJBUl9N
RU1fQkFTRSwgMHg0MDAwLCBOVUxMLCBOVUxMfSwKIAl7RF9BTEwsIF9NTUlPKFZHVF9QVklORk9f
UEFHRSksIFZHVF9QVklORk9fU0laRSwKIAkJcHZpbmZvX21taW9fcmVhZCwgcHZpbmZvX21taW9f
d3JpdGV9LAogCXtEX0FMTCwgTEdDX1BBTEVUVEUoUElQRV9BLCAwKSwgMTAyNCwgTlVMTCwgTlVM
TH0sCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2
