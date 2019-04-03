Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2352253ywo;
        Tue, 2 Apr 2019 22:29:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQdCanhol4OIh0erAYwZ4RsC9AgIfMvd8Lw4oMxI0vpgPNy2PZmaI+RZQPTGj+NjWo6MTH
X-Received: by 2002:aa7:8c13:: with SMTP id c19mr49941136pfd.225.1554269364080;
        Tue, 02 Apr 2019 22:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554269364; cv=none;
        d=google.com; s=arc-20160816;
        b=oEHEoAg9EgeTW5PxEApZyd4Bz/4LISOI/hZ+/4dBiXAL/8D4MwV3GY5lzi8AC8jrCo
         jgV7rgUWbPdesGBlWioQAeAJasbzA+M1GgzPyNZL4H5X88DIXKXA9vaJ1YFueJ552e/k
         mbI4SvM7jlwR2rBQCouhYObb/Y+pXOASj28mM/RexYMPEK3CifWb4VyFcFUubxvnLO07
         MrdwTYdtimPzTAdrzmuBBqWueqEEYvUIEUV0AGajvK94fe6Av7wSH6UA1E96BWVi+o3D
         KtS0fFCr+gifm3I60unpFqpvIfoiIw/j0400liSYW/dHPCV+cnrF9l4PVNv1+oQxSywN
         V2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=D712+GqD+7jddvGXAdKl4juDGgeRHGomFAYtyqofUPU=;
        b=ZMjIDHoX04EnLmCOokEao9Hvd6a0admZwLF86PHWM7hj/Hr5FnwJCPx8VJzvnjjhK+
         mk1+Nd0mrpcAZV2JgdpxdDAe7Gv+Ib/u7ugVXwpKq4vly+Sh8O3p3DQwiaYhuLVdF4Hs
         UH64q778O1hgMrBcGmClzW03bz4kdzM2RrQCdcyRBQ0YjleeoYnEQQxY6++SyKpvQwK4
         ULbvCg0AhPryUurTVs1uBaqyTuN6XQYfhDKTlkCukV7v/AxWWxZtWQMgn6RPDNeJchw6
         J+qiGXgQLBY1ySTwfFfz3sT1gqmiNrTwqLaxMzHJbGJcnED/p9fwy5nUfP+8v5GTf1rt
         UB/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id e124si12832037pfc.80.2019.04.02.22.29.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 22:29:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC0B6E814;
	Wed,  3 Apr 2019 05:29:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69206E814
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 05:29:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 22:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,303,1549958400"; d="scan'208";a="137136416"
Received: from unknown (HELO xzhan34-rh.bj.intel.com) ([10.238.154.52])
 by fmsmga008.fm.intel.com with ESMTP; 02 Apr 2019 22:29:19 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/gvt: addressed guest GPU hang with HWS index mode
Date: Wed,  3 Apr 2019 13:32:44 +0800
Message-Id: <20190403053244.3487-1-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.15.1
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

d2l0aCB0aGUgaW50cm9kdWNlIG9mICJzd2l0Y2ggdG8gdXNlIEhXUyBpbmRpY2VzIHJhdGhlciB0
aGFuIGFkZHJlc3MiLApndWVzdCBHUFUgaGFuZyBvYnNlcnZlZCB3aGVuIHJ1bm5pbmcgd29ya2xv
YWRzIHdoaWNoIHdpbGwgdXBkYXRlIHRoZQpzZXFubyB0byB0aGUgcmVhbCBIVyBIV1NQLCBub3Qg
dml0dXJhbCBHUFUgSFdTUCBhbmQgdGhlbiBjYXVzZSBHUFUgaGFuZy4KCnRoaXMgcGF0Y2ggaXMg
dG8gcmV2b2tlIGluZGV4IG1vZGUgaW4gUElQRV9DVFJMIGFuZCBNSV9GTFVTSF9EVyBhbmQKcGF0
Y2ggZ3Vlc3QgR1BVIEhXU1AgYWRkcmVzcyB2YWx1ZSB0byB0aGVzZSBjb21tYW5kcy4KCkZpeGVz
OiA1NDkzOWVhMGIoImRybS9pOTE1OiBTd2l0Y2ggdG8gdXNlIEhXUyBpbmRpY2VzIHJhdGhlciB0
aGFuCmFkZHJlc3NlcyIpCgp2MzogaGFuZGxlIGluZGV4IG1vZGUgdG8gZ21hIGNvbnZlcnNpb24g
d2l0aGluIGNtZCBoYW5kbGVyIGl0c2VsZi4KdjI6IFBJUEVfQ1RSTCBhbmQgTUlfRkxVU0hfRFcg
aGFzIGRpZmZlcmVudCBhZGRyZXNzIG9mZnNldCwgb2Zmc2V0IGlzCmFsc28gcGFzc2VkIGZvciBn
bWEgYWRkcmVzcyB1cGRhdGUuIDx6aGVueXU+CgpTaWduZWQtb2ZmLWJ5OiBYaWFvbGluIFpoYW5n
IDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Y21kX3BhcnNlci5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2NtZF9wYXJzZXIuYwppbmRleCBiNDIwOTE5Mjc5YzcuLjU1Yzc4ZjZiNDFmNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCkBAIC0xMDc3LDYgKzEwNzcsOCBAQCBzdGF0
aWMgaW50IGNtZF9oYW5kbGVyX3BpcGVfY29udHJvbChzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUg
KnMpCiAJYm9vbCBpbmRleF9tb2RlID0gZmFsc2U7CiAJdW5zaWduZWQgaW50IHBvc3Rfc3luYzsK
IAlpbnQgcmV0ID0gMDsKKwl1MzIgaHdzX2dwYTsKKwl1MzIgdmFsOwogCiAJcG9zdF9zeW5jID0g
KGNtZF92YWwocywgMSkgJiBQSVBFX0NPTlRST0xfUE9TVF9TWU5DX09QX01BU0spID4+IDE0Owog
CkBAIC0xMDk4LDggKzExMDAsMTYgQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9waXBlX2NvbnRy
b2woc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQogCQkJCS8qIFN0b3JlIERhdGEgSW5kZXgg
Ki8KIAkJCQlpZiAoY21kX3ZhbChzLCAxKSAmICgxIDw8IDIxKSkKIAkJCQkJaW5kZXhfbW9kZSA9
IHRydWU7Ci0JCQkJcmV0IHw9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSwgc2l6ZW9mKHU2NCks
Ci0JCQkJCQlpbmRleF9tb2RlKTsKKwkJCQlpZiAoaW5kZXhfbW9kZSkgeworCQkJCQlod3NfZ3Bh
ID0gcy0+dmdwdS0+aHdzX3BnYVtzLT5yaW5nX2lkXTsKKwkJCQkJZ21hID0gaHdzX2dwYSArIGdt
YTsKKwkJCQkJZ21hIHw9IGNtZF92YWwocywgMikgJiBHRU5NQVNLKDIsIDApOworCQkJCQlwYXRj
aF92YWx1ZShzLCBjbWRfcHRyKHMsIDIpLCBnbWEpOworCQkJCQl2YWwgPSBjbWRfdmFsKHMsIDEp
ICYgKH4oMSA8PCAyMSkpOworCQkJCQlwYXRjaF92YWx1ZShzLCBjbWRfcHRyKHMsIDEpLCB2YWwp
OworCQkJCX0gZWxzZQorCQkJCQlyZXQgfD0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21hLAorCQkJ
CQkJc2l6ZW9mKHU2NCksIGluZGV4X21vZGUpOwogCQkJfQogCQl9CiAJfQpAQCAtMTU5OCw2ICsx
NjA4LDggQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9taV9mbHVzaF9kdyhzdHJ1Y3QgcGFyc2Vy
X2V4ZWNfc3RhdGUgKnMpCiAJdW5zaWduZWQgbG9uZyBnbWE7CiAJYm9vbCBpbmRleF9tb2RlID0g
ZmFsc2U7CiAJaW50IHJldCA9IDA7CisJdTMyIGh3c19ncGE7CisJdTMyIHZhbDsKIAogCS8qIENo
ZWNrIHBvc3Qtc3luYyBhbmQgcHBndHQgYml0ICovCiAJaWYgKCgoY21kX3ZhbChzLCAwKSA+PiAx
NCkgJiAweDMpICYmIChjbWRfdmFsKHMsIDEpICYgKDEgPDwgMikpKSB7CkBAIC0xNjA3LDcgKzE2
MTksMTYgQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9taV9mbHVzaF9kdyhzdHJ1Y3QgcGFyc2Vy
X2V4ZWNfc3RhdGUgKnMpCiAJCS8qIFN0b3JlIERhdGEgSW5kZXggKi8KIAkJaWYgKGNtZF92YWwo
cywgMCkgJiAoMSA8PCAyMSkpCiAJCQlpbmRleF9tb2RlID0gdHJ1ZTsKLQkJcmV0ID0gY21kX2Fk
ZHJlc3NfYXVkaXQocywgZ21hLCBzaXplb2YodTY0KSwgaW5kZXhfbW9kZSk7CisJCWlmIChpbmRl
eF9tb2RlKSB7CisJCQlod3NfZ3BhID0gcy0+dmdwdS0+aHdzX3BnYVtzLT5yaW5nX2lkXTsKKwkJ
CWdtYSA9IGh3c19ncGEgKyBnbWE7CisJCQlnbWEgfD0gY21kX3ZhbChzLCAxKSAmIEdFTk1BU0so
MiwgMCk7CisJCQlwYXRjaF92YWx1ZShzLCBjbWRfcHRyKHMsIDEpLCBnbWEpOworCQkJdmFsID0g
Y21kX3ZhbChzLCAwKSAmICh+KDEgPDwgMjEpKTsKKwkJCXBhdGNoX3ZhbHVlKHMsIGNtZF9wdHIo
cywgMCksIHZhbCk7CisJCX0gZWxzZQorCQkJcmV0ID0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21h
LAorCQkJCQlzaXplb2YodTY0KSwgaW5kZXhfbW9kZSk7CiAJfQogCS8qIENoZWNrIG5vdGlmeSBi
aXQgKi8KIAlpZiAoKGNtZF92YWwocywgMCkgJiAoMSA8PCA4KSkpCi0tIAoyLjE1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
