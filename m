Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp460591ywb;
        Fri, 22 Mar 2019 02:19:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHSLgRFYqj8s5XFHmezyBHQKAryNqgYzxRjV5TfsrWXDjl8FwV9Z38ll1QwdgKQyZBmzcL
X-Received: by 2002:a17:902:b181:: with SMTP id s1mr8373325plr.321.1553246341531;
        Fri, 22 Mar 2019 02:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553246341; cv=none;
        d=google.com; s=arc-20160816;
        b=jyrbrt0eAzz7ueY+agkMH1srVRh714ujnTre2l13jAzZ7WQofvLJ8iNitanN4MRJE3
         hWqWY+cHtDAKyUCLVCjt0anhxPx5mkOY2XoYb5EMBQ2oP8t6mDyL8cXxUZVuMjofRnKJ
         Do7KjeS81z20VY7hazNy9wGOz/ymITXnbcAF7+1YG9pZI3a7feJf3T6v3yAUkDP14khL
         ov/7uVh1TL+wwaJQRmn1kP3gSoekq6U80Pa7QbKJgOAsB9JBUvBLoHk9LDHyH3MNujth
         sNu5FvZ6E0iDuBOtMidfjbXwNAVl7xBgtD740PWIIA0v6AIJzvaq6OEaTzKkzQifqagJ
         hTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=MDroxwtAx0zSWwSkC8PzcIboO5e5SEpDrXDF6YJI/T8=;
        b=0qkKC7toPnNfuoUr/UtkSTN5bC6iBZASNJOZc0zDL94qlFIzjmevtKi7g6WdvPlyKy
         Ip/dmxTRwFWipqxSBB8CVorblqRm8Yn866+0N7L7nZYdklVkn4mBuUWLh+Hegeu0AsIS
         Nsk+Rmiayd7vCvP3D4iXZyiCd200vImredUhQxLZM8lYivRxPMhQKcW8yHFpiYdpvfJc
         dR825R7GEyLY0yeB5YRZt4SRnPAjIxDBRv6eRJ0pEyIwroM1TKQrNzAInaqkMm60qJqf
         Ij1T5NtxqyQPF22KQR+SEQzmJw3c/fCsOnouq75jiwoF3Ud6Eo78jrl2qcV9zYSH+XAM
         GjyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id w16si6417618pgj.217.2019.03.22.02.19.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2019 02:19:01 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B9C6E2E7;
	Fri, 22 Mar 2019 09:19:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1516E2E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Mar 2019 09:19:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Mar 2019 02:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="330975301"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2019 02:18:58 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1h7GKH-000HSM-P1; Fri, 22 Mar 2019 17:18:57 +0800
Date: Fri, 22 Mar 2019 17:18:22 +0800
From: kbuild test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: vReg_ops can be static
Message-ID: <20190322091822.GA103701@athens>
References: <201903221740.RwqIRLzW%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201903221740.RwqIRLzW%lkp@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: zhenyu.z.wang@intel.com, Xiao Zheng <xiao.zheng@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Yulei Zhang <yulei.zhang@intel.com>,
 terrence.xu@intel.com, kbuild-all@01.org, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiBkM2EzZDViZmYxYzMgKCJkcm0vaTkxNS9ndnQ6IHZHUFUgZGV2aWNlIGNvbmZpZyBk
YXRhIHNhdmUvcmVzdG9yZSBpbnRlcmZhY2UiKQpTaWduZWQtb2ZmLWJ5OiBrYnVpbGQgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4KLS0tCiBtaWdyYXRlLmMgfCAgIDE2ICsrKysrKysrLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9taWdyYXRlLmMKaW5kZXggZGNhNmVhZS4uYzBhYWMzMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvbWlncmF0ZS5jCkBAIC04MSw1NiArODEsNTYgQEAgc3RhdGljIGludCBleGVj
bGlzdF9zYXZlKGNvbnN0IHN0cnVjdCBndnRfbWlncmF0aW9uX29ial90ICpvYmopOwogLyoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBJbnRlcm5hbCBT
dGF0aWMgRnVuY3Rpb25zCiAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKiovCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2UmVnX29wcyA9IHsK
K3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2UmVnX29wcyA9IHsKIAku
cHJlX2NvcHkgPSBOVUxMLAogCS5wcmVfc2F2ZSA9IHZyZWdfc2F2ZSwKIAkucHJlX2xvYWQgPSB2
cmVnX2xvYWQsCiAJLnBvc3RfbG9hZCA9IE5VTEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlv
bl9vcGVyYXRpb25fdCBzUmVnX29wcyA9IHsKK3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9v
cGVyYXRpb25fdCBzUmVnX29wcyA9IHsKIAkucHJlX2NvcHkgPSBOVUxMLAogCS5wcmVfc2F2ZSA9
IHNyZWdfc2F2ZSwKIAkucHJlX2xvYWQgPSBzcmVnX2xvYWQsCiAJLnBvc3RfbG9hZCA9IE5VTEws
CiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2Y2ZnX3NwYWNlX29wcyA9
IHsKK3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2Y2ZnX3NwYWNlX29w
cyA9IHsKIAkucHJlX2NvcHkgPSBOVUxMLAogCS5wcmVfc2F2ZSA9IHZjZmdfc3BhY2Vfc2F2ZSwK
IAkucHJlX2xvYWQgPSB2Y2ZnX3NwYWNlX2xvYWQsCiAJLnBvc3RfbG9hZCA9IE5VTEwsCiB9Owog
Ci1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2Z3R0X2luZm9fb3BzID0geworc3Rh
dGljIHN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90IHZndHRfaW5mb19vcHMgPSB7CiAJ
LnByZV9jb3B5ID0gTlVMTCwKIAkucHJlX3NhdmUgPSB2Z2d0dF9zYXZlLAogCS5wcmVfbG9hZCA9
IHZnZ3R0X2xvYWQsCiAJLnBvc3RfbG9hZCA9IE5VTEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3Jh
dGlvbl9vcGVyYXRpb25fdCBpbWFnZV9oZWFkZXJfb3BzID0geworc3RhdGljIHN0cnVjdCBndnRf
bWlncmF0aW9uX29wZXJhdGlvbl90IGltYWdlX2hlYWRlcl9vcHMgPSB7CiAJLnByZV9jb3B5ID0g
TlVMTCwKIAkucHJlX3NhdmUgPSBpbWFnZV9oZWFkZXJfc2F2ZSwKIAkucHJlX2xvYWQgPSBpbWFn
ZV9oZWFkZXJfbG9hZCwKIAkucG9zdF9sb2FkID0gTlVMTCwKIH07CiAKLXN0cnVjdCBndnRfbWln
cmF0aW9uX29wZXJhdGlvbl90IHdvcmtsb2FkX29wcyA9IHsKK3N0YXRpYyBzdHJ1Y3QgZ3Z0X21p
Z3JhdGlvbl9vcGVyYXRpb25fdCB3b3JrbG9hZF9vcHMgPSB7CiAJLnByZV9jb3B5ID0gTlVMTCwK
IAkucHJlX3NhdmUgPSB3b3JrbG9hZF9zYXZlLAogCS5wcmVfbG9hZCA9IHdvcmtsb2FkX2xvYWQs
CiAJLnBvc3RfbG9hZCA9IE5VTEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRp
b25fdCBwcGd0dF9vcHMgPSB7CitzdGF0aWMgc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9u
X3QgcHBndHRfb3BzID0gewogCS5wcmVfY29weSA9IE5VTEwsCiAJLnByZV9zYXZlID0gcHBndHRf
c2F2ZSwKIAkucHJlX2xvYWQgPSBwcGd0dF9sb2FkLAogCS5wb3N0X2xvYWQgPSBOVUxMLAogfTsK
IAotc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgZXhlY2xpc3Rfb3BzID0geworc3Rh
dGljIHN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90IGV4ZWNsaXN0X29wcyA9IHsKIAku
cHJlX2NvcHkgPSBOVUxMLAogCS5wcmVfc2F2ZSA9IGV4ZWNsaXN0X3NhdmUsCiAJLnByZV9sb2Fk
ID0gZXhlY2xpc3RfbG9hZCwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2
