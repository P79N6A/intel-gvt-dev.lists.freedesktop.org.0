Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp7106431ywo;
        Thu, 11 Apr 2019 09:53:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsKnNKXuLUZkqXGISPM3ZvbaaGiQELxr+LawoNUsG0GZH+qfJQRLIgUUMFcNgqHwLaIT/T
X-Received: by 2002:a17:902:61:: with SMTP id 88mr10528079pla.166.1555001586589;
        Thu, 11 Apr 2019 09:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555001586; cv=none;
        d=google.com; s=arc-20160816;
        b=Yk0adebw7RK4y77WSYSPfXmy7SHW5ais8PTVkfnJd5NYFh8CgKS3QCZOhZZ7Fs0y13
         +tRkWJjMlmvZM4fzhm4ztyXTvVdbg3S9U1YngH00AZzmLcx5BMtr4R2z4YyYT1TKiiWs
         RHl79IHhQR6D9jzYN8X0hQMrK9GQlUNHtmASv7CkXnqKBBEAJFq+jKLDrSZRJvmEF925
         UFpCh+IruKIH4V44DXgbu6ZVSJvs8DNvl7h1SmXJk/x5G7ONnapiWtQFAol+2T+Ttq7K
         0rexUQsSB0Xovchv27re/yQkvTqPo1iS4EFyocP+Db4iV7hrCIJZiQWdlN+Ca8CGd2Pa
         O8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=dvlSG8rU6U2ADLKabmsczRTiiypPHd2n6cpaJpnps/o=;
        b=ZzGtH+iNws3lka33w1vvfR1DhiqmGAAgRONgcAZhf5dibCpyRIEMyjlLPV0ehKWXRp
         d+I0rtyVBYgDIvKGqeFD9U6CohCkF9mW5SRzEtkIBy2APv0jC3XWW6zupWd6+U8T+Qtq
         63IkDHgMxFlp/Qrlx0myB02l0NDoWQnSX0S60QCHOySGb3SWO4BUuIptxL2qlGmYifAa
         HQeWyThFmur1Pffcpp2oszF+/Fua1a/kiGw1YRh+khvNdDoFSZgEaSBNsEoDL2Pl3s2q
         3spBZ7fBSIbjWeUXlxGuJf0k+b4mrRq3cuyKrlGjC2xGZrB3kej8LaeOZnW3/poiCShK
         AiZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f35si25518400plh.433.2019.04.11.09.53.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 09:53:06 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BAB89919;
	Thu, 11 Apr 2019 16:53:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECFA89913;
 Thu, 11 Apr 2019 16:53:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 09:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,338,1549958400"; d="scan'208";a="141935755"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga003.jf.intel.com with ESMTP; 11 Apr 2019 09:48:02 -0700
Date: Thu, 11 Apr 2019 09:48:15 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20190411164815.GH31158@intel.com>
References: <20190411064910.GF17995@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190411064910.GF17995@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMDI6NDk6MTBQTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gCj4gSGksCj4gCj4gVGhpcyBpbmNsdWRlcyBvbmUgdkdQVSBkaXNwbGF5IHBsYW5lIHNp
emUgcmVncmVzc2lvbiBmaXgsCj4gb25lIGZvciBwcmV2ZW50aW5nIHVzZS1hZnRlci1mcmVlIGlu
IHBwZ3R0IHNoYWRvdyBmcmVlIGZ1bmN0aW9uCj4gYW5kIGFub3RoZXIgd2FybmluZyBmaXggZm9y
IGlvbWVtIGFjY2VzcyBhbm5vdGF0aW9uLgoKcHVsbGVkLCB0aGFua3MhCgo+IAo+IFRoYW5rcy4K
PiAtLQo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgY2Y5ZWQ2NjY3MWVjNWY2
Y2FjYzdiNmVmYmFkOWQ3YzllNWUzMTc3NjoKPiAKPiAgIGRybS9pOTE1L2d2dDogRml4IGtlcm5l
bGRvYyB0eXBvIGZvciBpbnRlbF92Z3B1X2VtdWxhdGVfaG90cGx1ZyAoMjAxOS0wNC0wNCAwODo0
NTo0NSArMDgwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
PiAKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXguZ2l0IHRhZ3MvZ3Z0LWZp
eGVzLTIwMTktMDQtMTEKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gY2Q3ODc5
Zjc5ZjgzYWVjNGJiMTNmMGY4MjNmMzIzOTExZGM1Mzk3YjoKPiAKPiAgIGRybS9pOTE1L2d2dDog
Um91bmR1cCBmYi0+aGVpZ2h0IGludG8gdGlsZSdzIGhlaWdodCBhdCBjYWx1Y2F0aW9uIGZiLT5z
aXplICgyMDE5LTA0LTExIDExOjA5OjUzICswODAwKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBndnQtZml4ZXMt
MjAxOS0wNC0xMQo+IAo+IC0gRml4IHNwYXJzZSB3YXJuaW5nIG9uIGlvbWVtIHVzYWdlIChDaHJp
cykKPiAtIFByZXZlbnQgdXNlLWFmdGVyLWZyZWUgZm9yIHBwZ3R0IHNoYWRvdyB0YWJsZSBmcmVl
IChDaHJpcykKPiAtIEZpeCBkaXNwbGF5IHBsYW5lIHNpemUgcmVncmVzc2lvbiBmb3IgdGlsZWQg
c3VyZmFjZSAoWGlvbmcpCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IENocmlzIFdpbHNvbiAoMik6Cj4gICAgICAg
ZHJtL2k5MTUvZ3Z0OiBBbm5vdGF0ZSBpb21lbSB1c2FnZQo+ICAgICAgIGRybS9pOTE1L2d2dDog
UHJldmVudCB1c2UtYWZ0ZXItZnJlZSBpbiBwcGd0dF9mcmVlX2FsbF9zcHQoKQo+IAo+IFhpb25n
IFpoYW5nICgxKToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IFJvdW5kdXAgZmItPmhlaWdodCBpbnRv
IHRpbGUncyBoZWlnaHQgYXQgY2FsdWNhdGlvbiBmYi0+c2l6ZQo+IAo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZG1hYnVmLmMgfCAgOSArKysrKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jICAgIHwgMTIgKysrKysrKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9rdm1ndC5jICB8ICA2ICsrKy0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gCj4gLS0gCj4gT3BlbiBTb3VyY2UgVGVjaG5vbG9n
eSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5l
dCAtLXJlY3Yta2V5cyA0RDc4MTgyNwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
