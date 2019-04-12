Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp7543225ywo;
        Thu, 11 Apr 2019 18:32:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybwWJEcvei6DgUaQMzGS0mbGKYUihHkBmmVq8Ws+bNhLs0X6UwN00udHtWnO3FIqEIOZeb
X-Received: by 2002:aa7:9392:: with SMTP id t18mr53760370pfe.45.1555032754104;
        Thu, 11 Apr 2019 18:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555032754; cv=none;
        d=google.com; s=arc-20160816;
        b=KwjZDihyLNza6Vu/vRODteii6nlGxojwxq97UGcgrBCfAXiuuVNAZQJkkG2kF25X1r
         yaXsgSHFkR+I2hOqJPpXu76jcnEUGXCV5ZidudJJCweglGbcmGF2IjI9Eriq1BDfmM3Q
         qkm4nFxCRVT2UFD/onqjdQCbzxCpMGGS9B+bbCVff+45Dww3Um9N28LT2uiq3Fw55X3e
         xrZfOkNwzXhHssovqOCLtxVpQrw2KbNhLbpJWneaOaieA7/+nuSmigAo4FrxK65i6rIL
         YHZ+6Ok5Nrd9s+kFzSTYYZXX3zQadAZKq5HqaUfngnMUO1ofgL2Qk59MPl6tvgjW1XOI
         QMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=gfxQQxS7T5JpWAKBspC3em67sscz1KFVaY1g45qASHk=;
        b=BsAkR34MroMM6syg4W7O8jE0pvY5JY1vY6DSmEbnTqPwLTRrK7WZto01khqe37wh7b
         ynbNZhoAKLE4AggcidLyf2tI42axsbCG28DXRNekg03A1A3tenxyNFTp/XY1XVd3a20l
         j9oXpMosLosBBeQchW+kgExCWwvH4l9HCQo1KBGDiZJ8muLJ7A0ss3udCY8kzxxgc+iH
         wW4WRI/FYYXxomspS2hEKaagIoAlHYHyFOWqEcYP1cpHqreB/9rujuwJ/6n7bdYh7HmQ
         4mr5okoGgKhAGdJGQc5RbE18ySv5xTYs9LkUECWc23gnZWlebsKM900HYiDTpIgZjy5r
         leAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id j9si22653179plk.125.2019.04.11.18.32.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 18:32:34 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD879892CD;
	Fri, 12 Apr 2019 01:32:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3C4892CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 01:32:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 18:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,339,1549958400"; d="scan'208";a="148561160"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2019 18:32:30 -0700
Subject: Re: [PATCH V2 3/6] drm/i915/gvt: Use snprintf() to prevent possible
 buffer overflow.
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-4-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <6950375d-593f-b689-0d19-53ecf6c7ffe6@intel.com>
Date: Fri, 12 Apr 2019 09:32:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411104631.7627-4-aleksei.gimbitskii@intel.com>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Cc: Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDQtMTEgMTg6NDYsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBGb3IgcHJp
bnRpbmcgdGhlIGludGVsX3ZncHUtPmlkLCBhIGJ1ZmZlciB3aXRoIGZpeGVkIGxlbmd0aCBpcyBh
bGxvY2F0ZWQKPiBvbiB0aGUgc3RhY2suIEJ1dCBpZiB2Z3B1LT5pZCBpcyBncmVhdGVyIHRoYW4g
NiBjaGFyYWN0ZXJzLCB0aGUgYnVmZmVyCj4gb3ZlcmZsb3cgd2lsbCBoYXBwZW4uIEV2ZW4gdGhl
IHN0cmluZyBvZiB0aGUgYW1vdW50IG9mIG1heCB2Z3B1IGlzIGxlc3MKPiB0aGF0IHRoZSBsZW5n
dGggYnVmZmVyIHJpZ2h0IG5vdywgaXQncyBiZXR0ZXIgdG8gcmVwbGFjZSBzcHJpbnRmKCkgd2l0
aAo+IHNucHJpbnRmKCkuCj4KPiB2MjoKPiAtIEluY3JlYXNlIHRoZSBzaXplIG9mIHRoZSBidWZm
ZXIuIChDb2xpbiBYdSkKPgo+IFRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpY2FsIGlzc3VlICM2
NzMgcmVwb3J0ZWQgYnkga2xvY3dvcmsuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJp
dHNraWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+Cj4gQ2M6IFpoZW55dSBXYW5nIDx6
aGVueXV3QGxpbnV4LmludGVsLmNvbT4KPiBDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwu
Y29tPgo+IENjOiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgo+IC0tLQpSZXZpZXdlZC1i
eTogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KClRoYW5rcyBmb3IgdGhlIGZpeCEKPiAg
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9kZWJ1Z2ZzLmMKPiBpbmRleCAyZWM4OWJjYjU5ZjEuLjhhOTYwNmY5MWU2OCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYwo+IEBAIC0xOTYsOSArMTk2LDkgQEAgREVGSU5F
X1NJTVBMRV9BVFRSSUJVVEUodmdwdV9zY2FuX25vbnByaXZiYl9mb3BzLAo+ICAgaW50IGludGVs
X2d2dF9kZWJ1Z2ZzX2FkZF92Z3B1KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQo+ICAgewo+ICAg
CXN0cnVjdCBkZW50cnkgKmVudDsKPiAtCWNoYXIgbmFtZVsxMF0gPSAiIjsKPiArCWNoYXIgbmFt
ZVsxNl0gPSAiIjsKPiAgIAo+IC0Jc3ByaW50ZihuYW1lLCAidmdwdSVkIiwgdmdwdS0+aWQpOwo+
ICsJc25wcmludGYobmFtZSwgMTYsICJ2Z3B1JWQiLCB2Z3B1LT5pZCk7Cj4gICAJdmdwdS0+ZGVi
dWdmcyA9IGRlYnVnZnNfY3JlYXRlX2RpcihuYW1lLCB2Z3B1LT5ndnQtPmRlYnVnZnNfcm9vdCk7
Cj4gICAJaWYgKCF2Z3B1LT5kZWJ1Z2ZzKQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKCi0tIApCZXN0
IFJlZ2FyZHMsCkNvbGluIFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
