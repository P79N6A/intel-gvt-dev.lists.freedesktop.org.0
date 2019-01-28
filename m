Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2805390ywd;
        Sun, 27 Jan 2019 19:52:08 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4QLPrCe7WfjkFsLdD46M3hJlLbweJXtKJrWFGuSV0Ti4oYnDvr3fBQ5TcJOa+l4yLiPen7
X-Received: by 2002:a63:554b:: with SMTP id f11mr18959973pgm.37.1548647528817;
        Sun, 27 Jan 2019 19:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548647528; cv=none;
        d=google.com; s=arc-20160816;
        b=kpzimykfXi6ZspDB++V7m65U/J+Nfd9dBJSNE9y/wEX5YINAGQehAwm4QavI82i9EG
         COGoYt8ZFXQPwLUfJE+KyXLKXzrnKlTZmz7QtLegWp1JGCSpsAWOPCOrpTqT8iS5Iuxv
         puphrqe48ymWsUW0Ao4sY2+bnMAVbiuejbD75AudZw5bXtINO2GK1dBt5RjAzFGso06k
         khkHfzAes/OpMH2wrI2GmZlKmikg3llPtKSNOYli1dqBz6sHnUChrTYB+yxU4TJrVWiU
         FKLm87c0WnqwQ6dKB7fpj2TGHZji2AjM5CTHuhfGrg36YFFhD+1/ENonqAf4zL2aG6Th
         5Tfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=gQ57RutjmwmQU5dFi9IK09tyJSh4R8gLQY01ZxgbVaA=;
        b=TDRvsTJw+WY5sNiksKwkm3XgU9ZaOUQQNJ9KD8poDGtrTEjXBenG0n7CNKAx6gHAFU
         pIdvasBcihRP5KT7a1StfB/n+c/Fi0ZTjTa0eaoUpp5V/47emrM86NlyXpUyr1y3Jvnz
         IQsX2fPzW44Ko3822kwFLFPcaM/K4U19esfeYYtd++P/NGau1oFnM/JRUEjGlg3oQZop
         2XC0cDnn1Lm+hCfAyt95u8SlsknQ8SxiRFrjpYQndoKEG62AqXqutKPjYgaeQTNL+w7Z
         fyIQEXe5OV/UqKSvBI6/sjd91Gc/Nt9o2kVDk04jq/AMBd5OG2DGN3omZcqK301sSk1i
         uM4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id j20si29748480pgb.520.2019.01.27.19.52.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Jan 2019 19:52:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73EC89CBE;
	Mon, 28 Jan 2019 03:52:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE5789CBE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 28 Jan 2019 03:52:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2019 19:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,532,1539673200"; d="scan'208";a="117941877"
Received: from shbuild888.sh.intel.com (HELO localhost) ([10.239.147.114])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jan 2019 19:52:03 -0800
Date: Mon, 28 Jan 2019 11:53:05 +0800
From: Feng Tang <feng.tang@intel.com>
To: "Zhao, Yakui" <yakui.zhao@intel.com>
Subject: Re: [RFC PATCH] drm/i915/gvt: Try cma allocation first for oos page
 setup
Message-ID: <20190128035305.g47wijqaob6evsbp@shbuild888>
References: <1548643580-91046-1-git-send-email-feng.tang@intel.com>
 <01363028D91B0B448414F51B4258CAA574C168BE@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01363028D91B0B448414F51B4258CAA574C168BE@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: "He, Min" <min.he@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgWWFrdWksCgpUaGFua3MgZm9yIHRoZSByZXZpZXchCgpPbiBNb24sIEphbiAyOCwgMjAxOSBh
dCAxMToyODoyOEFNICswODAwLCBaaGFvLCBZYWt1aSB3cm90ZToKPiAKPiAKPiA+LS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPiA+RnJvbTogaW50ZWwtZ3Z0LWRldiBbbWFpbHRvOmludGVsLWd2
dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uCj4gPkJlaGFsZiBPZiBGZW5n
IFRhbmcKPiA+U2VudDogTW9uZGF5LCBKYW51YXJ5IDI4LCAyMDE5IDEwOjQ2IEFNCj4gPlRvOiBp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhlbnl1IFdhbmcKPiA+PHpoZW55
dXdAbGludXguaW50ZWwuY29tPjsgV2FuZywgWmhpIEEgPHpoaS5hLndhbmdAaW50ZWwuY29tPjsg
WGlhbwo+ID5aaGVuZyA8eGlhby56aGVuZ0BpbnRlbC5jb20+OyBIZSwgTWluIDxtaW4uaGVAaW50
ZWwuY29tPjsgQmluZyBOaXUKPiA+PGJpbmcubml1QGludGVsLmNvbT4KPiA+Q2M6IFRhbmcsIEZl
bmcgPGZlbmcudGFuZ0BpbnRlbC5jb20+Cj4gPlN1YmplY3Q6IFtSRkMgUEFUQ0hdIGRybS9pOTE1
L2d2dDogVHJ5IGNtYSBhbGxvY2F0aW9uIGZpcnN0IGZvciBvb3MgcGFnZSBzZXR1cAo+ID4KPiA+
V2hlbiBkb2luZyBib290dGltZSBwcm9maWxpbmcsIHdlIGZvdW5kIHRoZSBvb3MgcGFnZSBzZXR1
cCB0YWtlcyBhYm91dAo+ID4yNX4zMCBtcywgd2hpbGUgdXNpbmcgY21hIGFsbG9jYXRpb24gdGFr
ZXMgbGVzcyB0aGFuIDEwIG1zLiBBbmQgaWYgdGhlCj4gPnByZWFsbG9jYXRlZF9vb3NfcGFnZXMg
aW5jcmVhc2VzIGluIGZ1dHVyZSwgaXQgd2lsbCBzYXZlIG1vcmUuCj4gPgo+ID5UaGlzIGNvbW1p
dCB3aWxsIHRyeSB0byBhbGxvY2F0ZSB0aGUgbWVtb3J5IGZyb20gQ01BIGZpcnN0LCBhbmQgZmFs
bCBiYWNrIHRvCj4gPnRoZSBvcmlnaW5hbCBremFsbG9jIGlmIENNQSBpcyBub3QgYXZhaWxhYmxl
Lgo+ID4KPiA+U2lnbmVkLW9mZi1ieTogRmVuZyBUYW5nIDxmZW5nLnRhbmdAaW50ZWwuY29tPgo+
ID4tLS0KPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKy0tLS0tCj4gPiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPiA+Cj4gPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPiA+aW5kZXggYzcxMDNkZC4u
ZThkNmYxMCAxMDA2NDQKPiA+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4g
PisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+ID5AQCAtMjQ5NiwxOCArMjQ5
NiwzNCBAQCBzdGF0aWMgdm9pZCBjbGVhbl9zcHRfb29zKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCkK
PiA+c3RhdGljIGludCBzZXR1cF9zcHRfb29zKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCkgIHsKPiA+
IAlzdHJ1Y3QgaW50ZWxfZ3Z0X2d0dCAqZ3R0ID0gJmd2dC0+Z3R0Owo+ID4tCXN0cnVjdCBpbnRl
bF92Z3B1X29vc19wYWdlICpvb3NfcGFnZTsKPiA+KwlzdHJ1Y3QgaW50ZWxfdmdwdV9vb3NfcGFn
ZSAqb29zX3BhZ2UsICpvb3NfcGFnZV9iYXNlOwo+ID4rCXN0cnVjdCBwYWdlICpjbWFfcGFnZTsK
PiA+KwlpbnQgbnBhZ2VzOwo+ID4gCWludCBpOwo+ID4gCWludCByZXQ7Cj4gPgo+ID4gCUlOSVRf
TElTVF9IRUFEKCZndHQtPm9vc19wYWdlX2ZyZWVfbGlzdF9oZWFkKTsKPiA+IAlJTklUX0xJU1Rf
SEVBRCgmZ3R0LT5vb3NfcGFnZV91c2VfbGlzdF9oZWFkKTsKPiA+Cj4gPisJLyogVHJ5IGNtYSBh
bGxvY2F0aW9uIGZpcnN0IHRvIHNhdmUgc2V0dXAgdGltZSAqLwo+ID4rCW5wYWdlcyA9IHByZWFs
bG9jYXRlZF9vb3NfcGFnZXMgKiBzaXplb2YoKm9vc19wYWdlKTsKPiA+KwlucGFnZXMgPSBESVZf
Uk9VTkRfVVAobnBhZ2VzLCBQQUdFX1NJWkUpOwo+ID4rCj4gPisJY21hX3BhZ2UgPSBkbWFfYWxs
b2NfZnJvbV9jb250aWd1b3VzKE5VTEwsIG5wYWdlcywgMSwgVFJVRSk7Cj4gPisJaWYgKGNtYV9w
YWdlKSB7Cj4gPisJCW9vc19wYWdlX2Jhc2UgPSBwYWdlX2FkZHJlc3MoY21hX3BhZ2UpOwo+ID4r
CQltZW1zZXQob29zX3BhZ2VfYmFzZSwgMCwgbnBhZ2VzIDw8IFBBR0VfU0hJRlQpOwo+ID4rCX0K
PiA+Kwo+IAo+IEN1cnJlbnRseSBpdCB3aWxsIHRyeSB0byBjYWxsIGt6YWxsb2MgZm9yIDgxOTIg
dGltZXMuCj4gU28gY2FuIHdlIGZpcnN0bHkgdXNlIHRoZSBrY2FsbG9jIHRvIGFsbG9jYXRlIHRo
ZSBtZW1vcnkgZm9yIGFsbCB0aGUgKm9vc19wYWdlIGFuZAo+IHRoZW4gaW5pdGlhbGl6ZSB0aGUg
b29zX3BhZ2UgbGlzdD8KCk9uZSBjb25jZXJuIHdpdGggdGhpcyBpcyB0aGUgc2l6ZSBvZiB0aGUg
b29zIG1lbW9yeSBpcyBhYm91dCAzM00sIHdoaWxlIGttYWxsb2MKbWF5IG5vdCBiZSBhYmxlIHRv
IGFsbG9jYXRlIHNvIGJpZyBhIGJsb2NrIChNQVhfT1JERVIgaXMgYWJvdXQgMTEsIHdoaWNoIGlz
IDhNQikuCgpBbm90aGVyIHF1ZXN0aW9uIGlzIGlmIHRoZSBremFsbG9jIGlzIG5lY2Vzc2FyeSBm
b3IgdGhpcyBzZXR1cCwgd2hpbGUga21hbGxvYwp3aWxsIGNvbnN1bWUgbXVjaCBsZXNzIHRpbWUu
Cgo+IAo+IEZvciB0aGUgQ01BOiB3ZSBuZWVkIHRvIHJlc2VydmUgc29tZSByZWdpb25zIGZvciBD
TUEuIFRoaXMgaXMgbm90IHJlY29tbWVuZGVkLgpUaGlzIGNtYSBhbGxvY2F0aW9uIGlzIGEgb25l
LXRpbWUgZGVhbCBpbiBib290IHBoYXNlLCB3aGljaCBzaG91bGQgYmUgZmluZS4gQWxzbwpmb3Ig
cGxhdGZvcm0gd2l0aCBubyBjbWEgZXhwbGljaXRseSBhbGxvY2F0ZWQsIHRoaXMgaXMgYSBub3Au
CgpUaGFua3MsCkZlbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldgo=
