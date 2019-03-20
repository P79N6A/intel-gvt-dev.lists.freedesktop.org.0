Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp383144ywb;
        Wed, 20 Mar 2019 00:32:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxubYFZvFhENn4vmGy9y/pICmHDLcdvjsYNwlF7up8XVlSI9sYMYkGQn8kkuiJRdzCQMnD4
X-Received: by 2002:a63:5541:: with SMTP id f1mr5989673pgm.38.1553067127583;
        Wed, 20 Mar 2019 00:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553067127; cv=none;
        d=google.com; s=arc-20160816;
        b=CDdg7T1kPy7j97Gy+dkSdGYbg0NFJ7ES20by8OnjHznCE2gxJ9QuYz9SnW+eBwSKob
         aMwnsWoUmBWOmb5IMFC0T/X2zOSFCL2uyEnZTcP7aII7IZKyk0wg4SerTUaUeMeoVPpL
         T9YSME+ud0LjIoc0B0URzPKLHnUTnhrlAgv6uZuBqIiTRKiy2g+mCNt5twDLpc2UdWYf
         aC/eQBjPTF4dP4O41fO+O3bhLGomSLKJKagefwfH9ZK4PYpRL7nhPwczUe/aXW6l/o96
         m7GdP13aAKENGU65ndgwlszSzzSx039qVscgmbiSwpFmOUfc875gJMe3emcCHlwwJaM+
         QZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=87TrMYvT451qsx9Z9w2P1MQIWRUe9a4/G2revXxpyRw=;
        b=FUDhuFH6V20hc7jizo/PZtK/6u+dtHnwJDU93GAL5FjOvYweZyD0I5pniQura1utPn
         htUtpPUrQeg4IkGllr0uSKBYqC61ICd0qbgrtD1XLUqDvh2gbNsKhDqcRtFctRyrEU8/
         i/GmJpc6FpL2Y/zfNTMAToP1hoZgF+m1xhs3jmpYCuunI4I631TVrFCRMayd+Sihz3g9
         YKwctk/BB/OaTnvfwI+uocX7Rtm+w6PRgthToa74rfJe0ERjybfKFWeIluWT9jKT48di
         ZjcfZEQQgjdPOXGFAHFA4gFZYibhC/zGC/E4a1dHW7uCPgaNCye4YEvNKRk6ErRtw+n/
         xYKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b11si1045452pgw.294.2019.03.20.00.32.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2019 00:32:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBE289BDB;
	Wed, 20 Mar 2019 07:32:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D743A89BDB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 07:32:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Mar 2019 00:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,248,1549958400"; d="scan'208";a="135585047"
Received: from vca-bj120.bj.intel.com ([10.240.192.120])
 by orsmga003.jf.intel.com with ESMTP; 20 Mar 2019 00:32:03 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: replaced register address with name
Date: Wed, 20 Mar 2019 13:14:03 -0400
Message-Id: <1553102043-29206-1-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW4gaW5pdF9za2lsX21taW9faW5mbywgcmVwbGFjZWQgcmVnaXN0ZXIgYWRkcmVzcyB3aXRoIHRo
ZSBrbm93bgpuYW1lIGZyb20gaTkxNV9yZWcuaCBkZWZpbml0aW9uIHRvIGltcHJvdmUgY29kZSBy
ZWFkYmlsaXR5LgoKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFuZyA8eGlhb2xpbi56aGFuZ0Bp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCA3OSAr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDAg
aW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxl
cnMuYwppbmRleCA2MzQxOGM4Li4wMmU3NDIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxl
cnMuYwpAQCAtMjgyNywyNiArMjgyNywyNiBAQCBzdGF0aWMgaW50IGluaXRfc2tsX21taW9faW5m
byhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAKIAlNTUlPX0RIKERCVUZfQ1RMLCBEX1NLTF9QTFVT
LCBOVUxMLCBnZW45X2RidWZfY3RsX21taW9fd3JpdGUpOwogCi0JTU1JT19EKF9NTUlPKDB4YTIx
MCksIERfU0tMX1BMVVMpOworCU1NSU9fRChHRU45X1BHX0VOQUJMRSwgRF9TS0xfUExVUyk7CiAJ
TU1JT19EKEdFTjlfTUVESUFfUEdfSURMRV9IWVNURVJFU0lTLCBEX1NLTF9QTFVTKTsKIAlNTUlP
X0QoR0VOOV9SRU5ERVJfUEdfSURMRV9IWVNURVJFU0lTLCBEX1NLTF9QTFVTKTsKIAlNTUlPX0RG
SChHRU45X0dBTVRfRUNPX1JFR19SV19JQSwgRF9TS0xfUExVUywgRl9DTURfQUNDRVNTLCBOVUxM
LCBOVUxMKTsKLQlNTUlPX0RIKF9NTUlPKDB4NGRkYyksIERfU0tMX1BMVVMsIE5VTEwsIE5VTEwp
OwotCU1NSU9fREgoX01NSU8oMHg0MjA4MCksIERfU0tMX1BMVVMsIE5VTEwsIE5VTEwpOwotCU1N
SU9fRChfTU1JTygweDQ1NTA0KSwgRF9TS0xfUExVUyk7Ci0JTU1JT19EKF9NTUlPKDB4NDU1MjAp
LCBEX1NLTF9QTFVTKTsKLQlNTUlPX0QoX01NSU8oMHg0NjAwMCksIERfU0tMX1BMVVMpOwotCU1N
SU9fREgoX01NSU8oMHg0NjAxMCksIERfU0tMX1BMVVMsIE5VTEwsIHNrbF9sY3BsbF93cml0ZSk7
Ci0JTU1JT19ESChfTU1JTygweDQ2MDE0KSwgRF9TS0xfUExVUywgTlVMTCwgc2tsX2xjcGxsX3dy
aXRlKTsKLQlNTUlPX0QoX01NSU8oMHg2QzA0MCksIERfU0tMX1BMVVMpOwotCU1NSU9fRChfTU1J
TygweDZDMDQ4KSwgRF9TS0xfUExVUyk7Ci0JTU1JT19EKF9NTUlPKDB4NkMwNTApLCBEX1NLTF9Q
TFVTKTsKLQlNTUlPX0QoX01NSU8oMHg2QzA0NCksIERfU0tMX1BMVVMpOwotCU1NSU9fRChfTU1J
TygweDZDMDRDKSwgRF9TS0xfUExVUyk7Ci0JTU1JT19EKF9NTUlPKDB4NkMwNTQpLCBEX1NLTF9Q
TFVTKTsKLQlNTUlPX0QoX01NSU8oMHg2YzA1OCksIERfU0tMX1BMVVMpOwotCU1NSU9fRChfTU1J
TygweDZjMDVjKSwgRF9TS0xfUExVUyk7Ci0JTU1JT19ESChfTU1JTygweDZjMDYwKSwgRF9TS0xf
UExVUywgZHBsbF9zdGF0dXNfcmVhZCwgTlVMTCk7CisJTU1JT19ESChNTUNEX01JU0NfQ1RSTCwg
RF9TS0xfUExVUywgTlVMTCwgTlVMTCk7CisJTU1JT19ESChDSElDS0VOX1BBUjFfMSwgRF9TS0xf
UExVUywgTlVMTCwgTlVMTCk7CisJTU1JT19EKERDX1NUQVRFX0VOLCBEX1NLTF9QTFVTKTsKKwlN
TUlPX0QoRENfU1RBVEVfREVCVUcsIERfU0tMX1BMVVMpOworCU1NSU9fRChDRENMS19DVEwsIERf
U0tMX1BMVVMpOworCU1NSU9fREgoTENQTEwxX0NUTCwgRF9TS0xfUExVUywgTlVMTCwgc2tsX2xj
cGxsX3dyaXRlKTsKKwlNTUlPX0RIKExDUExMMl9DVEwsIERfU0tMX1BMVVMsIE5VTEwsIHNrbF9s
Y3BsbF93cml0ZSk7CisJTU1JT19EKF9NTUlPKF9EUExMMV9DRkdDUjEpLCBEX1NLTF9QTFVTKTsK
KwlNTUlPX0QoX01NSU8oX0RQTEwyX0NGR0NSMSksIERfU0tMX1BMVVMpOworCU1NSU9fRChfTU1J
TyhfRFBMTDNfQ0ZHQ1IxKSwgRF9TS0xfUExVUyk7CisJTU1JT19EKF9NTUlPKF9EUExMMV9DRkdD
UjIpLCBEX1NLTF9QTFVTKTsKKwlNTUlPX0QoX01NSU8oX0RQTEwyX0NGR0NSMiksIERfU0tMX1BM
VVMpOworCU1NSU9fRChfTU1JTyhfRFBMTDNfQ0ZHQ1IyKSwgRF9TS0xfUExVUyk7CisJTU1JT19E
KERQTExfQ1RSTDEsIERfU0tMX1BMVVMpOworCU1NSU9fRChEUExMX0NUUkwyLCBEX1NLTF9QTFVT
KTsKKwlNTUlPX0RIKERQTExfU1RBVFVTLCBEX1NLTF9QTFVTLCBkcGxsX3N0YXR1c19yZWFkLCBO
VUxMKTsKIAogCU1NSU9fREgoU0tMX1BTX1dJTl9QT1MoUElQRV9BLCAwKSwgRF9TS0xfUExVUywg
TlVMTCwgcGZfd3JpdGUpOwogCU1NSU9fREgoU0tMX1BTX1dJTl9QT1MoUElQRV9BLCAxKSwgRF9T
S0xfUExVUywgTlVMTCwgcGZfd3JpdGUpOwpAQCAtMjk2NSw0MCArMjk2NSw0MSBAQCBzdGF0aWMg
aW50IGluaXRfc2tsX21taW9faW5mbyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAJTU1JT19ESChf
TU1JTyhfUkVHXzcwMUM0KFBJUEVfQywgMykpLCBEX1NLTF9QTFVTLCBOVUxMLCBOVUxMKTsKIAlN
TUlPX0RIKF9NTUlPKF9SRUdfNzAxQzQoUElQRV9DLCA0KSksIERfU0tMX1BMVVMsIE5VTEwsIE5V
TEwpOwogCi0JTU1JT19EKF9NTUlPKDB4NzAzODApLCBEX1NLTF9QTFVTKTsKLQlNTUlPX0QoX01N
SU8oMHg3MTM4MCksIERfU0tMX1BMVVMpOworCU1NSU9fRChfTU1JTyhfUExBTkVfQ1RMXzNfQSks
IERfU0tMX1BMVVMpOworCU1NSU9fRChfTU1JTyhfUExBTkVfQ1RMXzNfQiksIERfU0tMX1BMVVMp
OwogCU1NSU9fRChfTU1JTygweDcyMzgwKSwgRF9TS0xfUExVUyk7CiAJTU1JT19EKF9NTUlPKDB4
NzIzOWMpLCBEX1NLTF9QTFVTKTsKLQlNTUlPX0QoX01NSU8oMHg3MDM5YyksIERfU0tMX1BMVVMp
OworCU1NSU9fRChfTU1JTyhfUExBTkVfU1VSRl8zX0EpLCBEX1NLTF9QTFVTKTsKIAotCU1NSU9f
RChfTU1JTygweDhmMDc0KSwgRF9TS0xfUExVUyk7Ci0JTU1JT19EKF9NTUlPKDB4OGYwMDQpLCBE
X1NLTF9QTFVTKTsKLQlNTUlPX0QoX01NSU8oMHg4ZjAzNCksIERfU0tMX1BMVVMpOworCU1NSU9f
RChDU1JfU1NQX0JBU0UsIERfU0tMX1BMVVMpOworCU1NSU9fRChDU1JfSFRQX1NLTCwgRF9TS0xf
UExVUyk7CisJTU1JT19EKENTUl9MQVNUX1dSSVRFLCBEX1NLTF9QTFVTKTsKIAotCU1NSU9fRChf
TU1JTygweGIxMWMpLCBEX1NLTF9QTFVTKTsKKwlNTUlPX0QoQkRXX1NDUkFUQ0gxLCBEX1NLTF9Q
TFVTKTsKIAotCU1NSU9fRChfTU1JTygweDUxMDAwKSwgRF9TS0xfUExVUyk7Ci0JTU1JT19EKF9N
TUlPKDB4NmMwMGMpLCBEX1NLTF9QTFVTKTsKKwlNTUlPX0QoU0tMX0RGU00sIERfU0tMX1BMVVMp
OworCU1NSU9fRChESVNQSU9fQ1JfVFhfQk1VX0NSMCwgRF9TS0xfUExVUyk7CiAKLQlNTUlPX0Yo
X01NSU8oMHhjODAwKSwgMHg3ZjgsIEZfQ01EX0FDQ0VTUywgMCwgMCwgRF9TS0xfUExVUywKKwlN
TUlPX0YoR0VOOV9HRlhfTU9DUygwKSwgMHg3ZjgsIEZfQ01EX0FDQ0VTUywgMCwgMCwgRF9TS0xf
UExVUywKIAkJTlVMTCwgTlVMTCk7Ci0JTU1JT19GKF9NTUlPKDB4YjAyMCksIDB4ODAsIEZfQ01E
X0FDQ0VTUywgMCwgMCwgRF9TS0xfUExVUywKKwlNTUlPX0YoR0VON19MM0NOVExSRUcyLCAweDgw
LCBGX0NNRF9BQ0NFU1MsIDAsIDAsIERfU0tMX1BMVVMsCiAJCU5VTEwsIE5VTEwpOwogCiAJTU1J
T19EKFJQTV9DT05GSUcwLCBEX1NLTF9QTFVTKTsKIAlNTUlPX0QoX01NSU8oMHhkMDgpLCBEX1NL
TF9QTFVTKTsKIAlNTUlPX0QoUkM2X0xPQ0FUSU9OLCBEX1NLTF9QTFVTKTsKLQlNTUlPX0RGSChf
TU1JTygweDIwZTApLCBEX1NLTF9QTFVTLCBGX01PREVfTUFTSywgTlVMTCwgTlVMTCk7Ci0JTU1J
T19ERkgoX01NSU8oMHgyMGVjKSwgRF9TS0xfUExVUywgRl9NT0RFX01BU0sgfCBGX0NNRF9BQ0NF
U1MsCisJTU1JT19ERkgoR0VON19GRl9TTElDRV9DU19DSElDS0VOMSwgRF9TS0xfUExVUywgRl9N
T0RFX01BU0ssCisJCU5VTEwsIE5VTEwpOworCU1NSU9fREZIKEdFTjlfQ1NfREVCVUdfTU9ERTEs
IERfU0tMX1BMVVMsIEZfTU9ERV9NQVNLIHwgRl9DTURfQUNDRVNTLAogCQlOVUxMLCBOVUxMKTsK
IAogCS8qIFRSVFQgKi8KLQlNTUlPX0RGSChfTU1JTygweDRkZTApLCBEX1NLTF9QTFVTLCBGX0NN
RF9BQ0NFU1MsIE5VTEwsIE5VTEwpOwotCU1NSU9fREZIKF9NTUlPKDB4NGRlNCksIERfU0tMX1BM
VVMsIEZfQ01EX0FDQ0VTUywgTlVMTCwgTlVMTCk7Ci0JTU1JT19ERkgoX01NSU8oMHg0ZGU4KSwg
RF9TS0xfUExVUywgRl9DTURfQUNDRVNTLCBOVUxMLCBOVUxMKTsKLQlNTUlPX0RGSChfTU1JTygw
eDRkZWMpLCBEX1NLTF9QTFVTLCBGX0NNRF9BQ0NFU1MsIE5VTEwsIE5VTEwpOwotCU1NSU9fREZI
KF9NTUlPKDB4NGRmMCksIERfU0tMX1BMVVMsIEZfQ01EX0FDQ0VTUywgTlVMTCwgTlVMTCk7Ci0J
TU1JT19ERkgoX01NSU8oMHg0ZGY0KSwgRF9TS0xfUExVUywgRl9DTURfQUNDRVNTLAorCU1NSU9f
REZIKFRSVkFUVEwzUFRSRFcoMCksIERfU0tMX1BMVVMsIEZfQ01EX0FDQ0VTUywgTlVMTCwgTlVM
TCk7CisJTU1JT19ERkgoVFJWQVRUTDNQVFJEVygxKSwgRF9TS0xfUExVUywgRl9DTURfQUNDRVNT
LCBOVUxMLCBOVUxMKTsKKwlNTUlPX0RGSChUUlZBVFRMM1BUUkRXKDIpLCBEX1NLTF9QTFVTLCBG
X0NNRF9BQ0NFU1MsIE5VTEwsIE5VTEwpOworCU1NSU9fREZIKFRSVkFUVEwzUFRSRFcoMyksIERf
U0tMX1BMVVMsIEZfQ01EX0FDQ0VTUywgTlVMTCwgTlVMTCk7CisJTU1JT19ERkgoVFJWQURSLCBE
X1NLTF9QTFVTLCBGX0NNRF9BQ0NFU1MsIE5VTEwsIE5VTEwpOworCU1NSU9fREZIKFRSVFRFLCBE
X1NLTF9QTFVTLCBGX0NNRF9BQ0NFU1MsCiAJCU5VTEwsIGdlbjlfdHJ0dGVfd3JpdGUpOwogCU1N
SU9fREgoX01NSU8oMHg0ZGZjKSwgRF9TS0xfUExVUywgTlVMTCwgZ2VuOV90cnR0X2NoaWNrZW5f
d3JpdGUpOwogCkBAIC0zMDExLDcgKzMwMTIsNyBAQCBzdGF0aWMgaW50IGluaXRfc2tsX21taW9f
aW5mbyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAJTU1JT19ESChETUFfQ1RSTCwgRF9TS0xfUExV
UywgTlVMTCwgZG1hX2N0cmxfd3JpdGUpOwogCiAJTU1JT19EKF9NTUlPKDB4NjU5MDApLCBEX1NL
TF9QTFVTKTsKLQlNTUlPX0QoX01NSU8oMHgxMDgyYzApLCBEX1NLTF9QTFVTKTsKKwlNTUlPX0Qo
R0VONl9TVE9MRU5fUkVTRVJWRUQsIERfU0tMX1BMVVMpOwogCU1NSU9fRChfTU1JTygweDQwNjgp
LCBEX1NLTF9QTFVTKTsKIAlNTUlPX0QoX01NSU8oMHg2NzA1NCksIERfU0tMX1BMVVMpOwogCU1N
SU9fRChfTU1JTygweDZlNTYwKSwgRF9TS0xfUExVUyk7CkBAIC0zMDQyLDggKzMwNDMsOCBAQCBz
dGF0aWMgaW50IGluaXRfc2tsX21taW9faW5mbyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAJTU1J
T19ERkgoR0VOOV9XTV9DSElDS0VOMywgRF9TS0xfUExVUywgRl9NT0RFX01BU0sgfCBGX0NNRF9B
Q0NFU1MsCiAJCSBOVUxMLCBOVUxMKTsKIAotCU1NSU9fRChfTU1JTygweDRhYjgpLCBEX0tCTCB8
IERfQ0ZMKTsKLQlNTUlPX0QoX01NSU8oMHgyMjQ4KSwgRF9TS0xfUExVUyk7CisJTU1JT19EKEdB
TVRfQ0hLTl9CSVRfUkVHLCBEX0tCTCk7CisJTU1JT19EKEdFTjlfQ1RYX1BSRUVNUFRfUkVHLCBE
X0tCTCB8IERfU0tMKTsKIAogCXJldHVybiAwOwogfQotLSAKMS44LjMuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
