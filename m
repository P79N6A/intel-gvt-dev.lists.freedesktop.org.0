Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp3039826ywb;
        Mon, 18 Mar 2019 19:25:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzm1ctZQhIuzj/i7u4FKA5EifCCkRdJIlCtkGkLruD73iBoU8UsSvWPFQ8bq2Vc7621sbek
X-Received: by 2002:a17:902:7896:: with SMTP id q22mr23264430pll.66.1552962326551;
        Mon, 18 Mar 2019 19:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552962326; cv=none;
        d=google.com; s=arc-20160816;
        b=ARplRLZfw+91e+vNj6FYIziOgFUWw/ZKUDkrr65+sSG+2tEvDpMtDJX9892urs8zd+
         V9N9bn+sWYV0OFvQzg+i5N04uhW5yHmN5bM0n6XNVSGAeKtweO6Fag9tNePANMJ7V40d
         5sFdwWk9vt+RKSseUeT1DUW4WHAFt3q6NjRf/5wdGYrznVlIIF8bdmNwtJLAUOiAc7Wn
         MEtYA5qikprSAloQ0L3gqGGMt4Cm3grhc5pTpLQhYXmbdlPU6arPAq6IosSXgc/pMqxj
         lge+9tOStva6aiyppZT7X1swnPzCNO065uzW7EDYJNcIsIH/lYSLz2OZoyd3b9osHW82
         JvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=clfY35dv9OuOYvWMCIp0RA8tWBKIZXeJAOlRXXTiTYg=;
        b=R04G/fFUjaVFEnNArO4QoBRAEJvlqsgku7dSZISZ4UgqL4J95rlNCBaEhY7yfZfwhz
         sFf8Fhgtd834+ILKF+Ir0m5RsbI8ZdRyQJdV6Cg/l/M5czzKdZnz8H+0BdAZeapb9mxQ
         FYF7hzDJJI3d4bPwQXr+t/sg8UAYfva1e1Jtu2qFp7mgZTgnOUF53h7kJrvpjuQi1sbM
         whEd31WcHy65f1e7WV72IBlpBDElAugh+7AMVUifYu+FObB+DI0NS6vuZ7TX8g7qv0XC
         w277hYAph1/ItQVyTXlwGvAFe/V6wOiQAQunbah/HzDnDqPNHZIVLWrsI7JoX8TM6byL
         ih+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id x12si7098591pll.236.2019.03.18.19.25.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2019 19:25:26 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1EA89740;
	Tue, 19 Mar 2019 02:25:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF16989740
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Mar 2019 02:25:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2019 19:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,496,1544515200"; d="scan'208";a="152940075"
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2019 19:25:22 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: Correct the calculation of plane size
Date: Tue, 19 Mar 2019 10:28:44 +0800
Message-Id: <1552962525-3786-1-git-send-email-xiong.y.zhang@intel.com>
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

c3RyaWRlIGlzbid0IGluIHVuaXQgb2YgcGl4ZWwsIGl0IGlzIGJ5dGVzLCBzbyBjYWxjdWxhdGlv
biBvZgpwbGFuZSBzaXplIGRvZXNuJ3QgbmVlZCB0byBtdWx0aXBsZSBicHAuCgpTaWduZWQtb2Zm
LWJ5OiBYaW9uZyBaaGFuZyA8eGlvbmcueS56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZG1hYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMK
aW5kZXggM2U3ZTJiOC4uNWQ4ODdmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2RtYWJ1Zi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwpAQCAt
MjM4LDkgKzIzOCw2IEBAIHN0YXRpYyBpbnQgdmdwdV9nZXRfcGxhbmVfaW5mbyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAogCQlkZWZhdWx0OgogCQkJZ3Z0X3ZncHVfZXJyKCJpbnZhbGlkIHRpbGlu
ZyBtb2RlOiAleFxuIiwgcC50aWxlZCk7CiAJCX0KLQotCQlpbmZvLT5zaXplID0gKCgocC5zdHJp
ZGUgKiBwLmhlaWdodCAqIHAuYnBwKSAvIDgpICsKLQkJCSAgICAgIChQQUdFX1NJWkUgLSAxKSkg
Pj4gUEFHRV9TSElGVDsKIAl9IGVsc2UgaWYgKHBsYW5lX2lkID09IERSTV9QTEFORV9UWVBFX0NV
UlNPUikgewogCQlyZXQgPSBpbnRlbF92Z3B1X2RlY29kZV9jdXJzb3JfcGxhbmUodmdwdSwgJmMp
OwogCQlpZiAocmV0KQpAQCAtMjYyLDE0ICsyNTksMTMgQEAgc3RhdGljIGludCB2Z3B1X2dldF9w
bGFuZV9pbmZvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQlpbmZvLT54X2hvdCA9IFVJTlRf
TUFYOwogCQkJaW5mby0+eV9ob3QgPSBVSU5UX01BWDsKIAkJfQotCi0JCWluZm8tPnNpemUgPSAo
KChpbmZvLT5zdHJpZGUgKiBjLmhlaWdodCAqIGMuYnBwKSAvIDgpCi0JCQkJKyAoUEFHRV9TSVpF
IC0gMSkpID4+IFBBR0VfU0hJRlQ7CiAJfSBlbHNlIHsKIAkJZ3Z0X3ZncHVfZXJyKCJpbnZhbGlk
IHBsYW5lIGlkOiVkXG4iLCBwbGFuZV9pZCk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAorCWlu
Zm8tPnNpemUgPSAoaW5mby0+c3RyaWRlICogaW5mby0+aGVpZ2h0ICsgUEFHRV9TSVpFIC0gMSkK
KwkJICAgICAgPj4gUEFHRV9TSElGVDsKIAlpZiAoaW5mby0+c2l6ZSA9PSAwKSB7CiAJCWd2dF92
Z3B1X2VycigiZmIgc2l6ZSBpcyB6ZXJvXG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwt
Z3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQt
ZGV2
