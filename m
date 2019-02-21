Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5051454ywa;
        Wed, 20 Feb 2019 17:53:09 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaPURucpPpXpPxsd1r3uGcasoN6EjHxvLraoluqH8UpAtr8HgY9mHHVdrl2lc9nLpsVHd9r
X-Received: by 2002:a17:902:70c5:: with SMTP id l5mr10190462plt.107.1550713989226;
        Wed, 20 Feb 2019 17:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550713989; cv=none;
        d=google.com; s=arc-20160816;
        b=q0SWwTlWht/wxggDwwoZJH7hrbJnwTP89eS0wOnGqs1RtJNCYs7r/HBVOYVq+8gFQc
         2/H6d4o/c1bDz9Nwvc+2F0HuKTwwbhSl0boFarBckV2Xz0DBGR6E58IUVgiyZ/mdNuGa
         EIcEIO0nseRETm15Wf62JH8JS9qwe6kAgb811EqtEn2vC/xAfGr1ja1V/y9jiGWlP9L1
         M6uh2mtcyej/Y9hrJMYs7ieWNobIaAwUm1w03o+u0NF6fhJdxKTsxpRQ4Xe56aSo2SdW
         52cynJJFXxcHSsRk33B1yMpan6KODSMxNzLF19+CoEwdvJDYM2ghoAg4AXDQ9OVYXUpN
         zIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=EZ0x0lueWx7RSX2bMUJyWc1sMkt9womK0tP30VnAqrc=;
        b=PMYfBpirRpawOajWPOzJoyhLZJ342xkCVhDzBmelfM/I7k26yWuz8tcfXtGY1yeuHw
         HOtJPEAeEZacO+9NZykvObySOycXO6xLqvlSPGrrYcLIhVQnKbUKa/6XJ++Nd7bI1lnu
         V7tGWUK2DoOVDANOay6NWxrhXvBfZicFk9jJUcX0n/NhTNwji5AJcjFDDBWEd1hMgE2+
         BVlInlVW4iBWzmn5MPf4pFBDC5eAK86WPIEB1Ap4GzHEwm8F+v8lFZAa9pT6n8913Yr1
         wSeKgaCeWUopq5e52qZ72j0Ao5w0dJX5UsAE5UzEbN+kHjUgJPM9B29XuqzaFuG1V7Pk
         cm4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id h3si20316944pfd.250.2019.02.20.17.53.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 17:53:09 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2395F892D4;
	Thu, 21 Feb 2019 01:53:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692A892D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 01:53:04 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 17:53:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="301340339"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga005.jf.intel.com with ESMTP; 20 Feb 2019 17:52:59 -0800
Date: Wed, 20 Feb 2019 20:47:45 -0500
From: Zhao Yan <yan.y.zhao@intel.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/5] vfio/migration: define kernel interfaces
Message-ID: <20190221014744.GJ16456@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <1550566334-3602-1-git-send-email-yan.y.zhao@intel.com>
 <20190219140918.476ac9d1.cohuck@redhat.com>
 <20190220073636.GD16456@joy-OptiPlex-7040>
 <20190220180813.17e6ab86.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190220180813.17e6ab86.cohuck@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, arei.gonglei@huawei.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, kevin.tian@intel.com,
 dgilbert@redhat.com, alex.williamson@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDY6MDg6MTNQTSArMDEwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBXZWQsIDIwIEZlYiAyMDE5IDAyOjM2OjM2IC0wNTAwCj4gWmhhbyBZYW4gPHlh
bi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKPiAKPiA+IE9uIFR1ZSwgRmViIDE5LCAyMDE5IGF0
IDAyOjA5OjE4UE0gKzAxMDAsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgMTkg
RmViIDIwMTkgMTY6NTI6MTQgKzA4MDAKPiA+ID4gWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwu
Y29tPiB3cm90ZToKPiAoLi4uKQo+ID4gPiA+ICsgKiAgICAgICAgICBTaXplIG9mIGRldmljZSBj
b25maWcgZGF0YSBpcyBzbWFsbGVyIHRoYW4gb3IgZXF1YWwgdG8gdGhhdCBvZgo+ID4gPiA+ICsg
KiAgICAgICAgICBkZXZpY2UgY29uZmlnIHJlZ2lvbi4gIAo+ID4gPiAKPiA+ID4gTm90IHN1cmUg
aWYgSSB1bmRlcnN0YW5kIHRoYXQgc2VudGVuY2UgY29ycmVjdGx5Li4uIGJ1dCB3aGF0IGlmIGEK
PiA+ID4gZGV2aWNlIGhhcyBtb3JlIGNvbmZpZyBzdGF0ZSB0aGFuIGZpdHMgaW50byB0aGlzIHJl
Z2lvbj8gSXMgdGhhdAo+ID4gPiBzdXBwb3NlZCB0byBiZSBjb3ZlcmVkIGJ5IHRoZSBkZXZpY2Ug
bWVtb3J5IHJlZ2lvbj8gT3IgaXMgdGhpcyBhc3N1bWVkCj4gPiA+IHRvIGJlIHNvbWV0aGluZyBz
byBleG90aWMgdGhhdCB3ZSBkb24ndCBuZWVkIHRvIHBsYW4gZm9yIGl0Pwo+ID4gPiAgIAo+ID4g
RGV2aWNlIGNvbmZpZyBkYXRhIGFuZCBkZXZpY2UgY29uZmlnIHJlZ2lvbiBhcmUgYWxsIHByb3Zp
ZGVkIGJ5IHZlbmRvcgo+ID4gZHJpdmVyLCBzbyB2ZW5kb3IgZHJpdmVyIGlzIGFsd2F5cyBhYmxl
IHRvIGNyZWF0ZSBhIGxhcmdlIGVub3VnaCBkZXZpY2UKPiA+IGNvbmZpZyByZWdpb24gdG8gaG9s
ZCBkZXZpY2UgY29uZmlnIGRhdGEuCj4gPiBTbywgaWYgYSBkZXZpY2UgaGFzIGRhdGEgdGhhdCBh
cmUgYmV0dGVyIHRvIGJlIHNhdmVkIGFmdGVyIGRldmljZSBzdG9wIGFuZAo+ID4gc2F2ZWQvbG9h
ZGVkIGluIHN0cmljdCBvcmRlciwgdGhlIGRhdGEgbmVlZHMgdG8gYmUgaW4gZGV2aWNlIGNvbmZp
ZyByZWdpb24uCj4gPiBUaGlzIGtpbmQgb2YgZGF0YSBpcyBzdXBwb3NlZCB0byBiZSBzbWFsbC4K
PiA+IElmIHRoZSBkZXZpY2UgZGF0YSBjYW4gYmUgc2F2ZWQvbG9hZGVkIHNldmVyYWwgdGltZXMs
IGl0IGNhbiBhbHNvIGJlIHB1dAo+ID4gaW50byBkZXZpY2UgbWVtb3J5IHJlZ2lvbi4KPiAKPiBT
bywgaXQgaXMgdGhlIHZlbmRvciBkcml2ZXIncyBkZWNpc2lvbiB3aGljaCBkZXZpY2UgaW5mb3Jt
YXRpb24gc2hvdWxkCj4gZ28gdmlhIHdoaWNoIHJlZ2lvbj8gV2l0aCB0aGUgZGV2aWNlIGNvbmZp
ZyBkYXRhIHN1cHBvc2VkIHRvIGJlCj4gc2F2ZWQvbG9hZGVkIGluIG9uZSBnbz8KUmlnaHQsIGV4
YWN0bHkuCgoKPiAoLi4uKQo+ID4gPiA+ICsvKiB2ZXJzaW9uIG51bWJlciBvZiB0aGUgZGV2aWNl
IHN0YXRlIGludGVyZmFjZSAqLwo+ID4gPiA+ICsjZGVmaW5lIFZGSU9fREVWSUNFX1NUQVRFX0lO
VEVSRkFDRV9WRVJTSU9OIDEgIAo+ID4gPiAKPiA+ID4gSG0uIElzIHRoaXMgc3VwcG9zZWQgdG8g
YmUgYmFja3dhcmRzLWNvbXBhdGlibGUsIHNob3VsZCB3ZSBuZWVkIHRvIGJ1bXAKPiA+ID4gdGhp
cz8KPiA+ID4gIAo+ID4gY3VycmVudGx5IG5vIGJhY2t3b3Jkcy1jb21wYXRpYmxlLiB3ZSBjYW4g
ZGlzY3VzcyBvbiB0aGF0Lgo+IAo+IEl0IG1pZ2h0IGJlIHVzZWZ1bCBpZiB3ZSBkaXNjb3ZlciB0
aGF0IHdlIG5lZWQgc29tZSBleHRlbnNpb25zLiBCdXQgSSdtCj4gbm90IHN1cmUgaG93IG11Y2gg
d29yayBpdCB3b3VsZCBiZS4KPiAKPiAoLi4uKQo+ID4gPiA+ICsvKgo+ID4gPiA+ICsgKiBERVZJ
Q0UgU1RBVEVTCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIEZvdXIgc3RhdGVzIGFyZSBkZWZpbmVk
IGZvciBhIFZGSU8gZGV2aWNlOgo+ID4gPiA+ICsgKiBSVU5OSU5HLCBSVU5OSU5HICYgTE9HR0lO
RywgU1RPUCAmIExPR0dJTkcsIFNUT1AuCj4gPiA+ID4gKyAqIFRoZXkgY2FuIGJlIHNldCBieSB3
cml0aW5nIHRvIGRldmljZV9zdGF0ZSBmaWVsZCBvZgo+ID4gPiA+ICsgKiB2ZmlvX2RldmljZV9z
dGF0ZV9jdGwgcmVnaW9uLiAgCj4gPiA+IAo+ID4gPiBXaG8gY29udHJvbHMgdGhpcz8gVXNlcnNw
YWNlPyAgCj4gPiAKPiA+IFllcy4gVXNlcnNwYWNlIG5vdGlmaWVzIHZlbmRvciBkcml2ZXIgdG8g
ZG8gdGhlIHN0YXRlIHN3aXRjaGluZy4KPiAKPiBNaWdodCBiZSBnb29kIHRvIG1lbnRpb24gdGhp
cyAoanVzdCB0byBtYWtlIGl0IG9idmlvdXMpLgo+CkdvdCBpdC4gdGhhbmtzCgo+ID4gPiA+ICsg
KiBMT0dHSU5HIHN0YXRlIGlzIGEgc3BlY2lhbCBzdGF0ZSB0aGF0IGl0IENBTk5PVCBleGlzdAo+
ID4gPiA+ICsgKiBpbmRlcGVuZGVudGx5LiAgCj4gPiA+IAo+ID4gPiBTbyBpdCdzIG5vdCBhIHN0
YXRlLCBidXQgcmF0aGVyIGEgbW9kaWZpZXI/Cj4gPiA+ICAgCj4gPiB5ZXMuIG9yIHRoaW5raW5n
IExPR0dJTkcvbm90IExPR0dJTkcgYXMgYml0IDEgb2YgYSBkZXZpY2Ugc3RhdGUsCj4gPiB3aGVy
ZWFzIFJVTk5JTkcvU1RPUFBFRCBpcyBiaXQgMCBvZiBhIGRldmljZSBzdGF0ZS4KPiA+IFRoZXkg
aGF2ZSB0byBiZSBnb3QgYXMgYSB3aG9sZS4KPiAKPiBTbyBpdCBpcyAob24gYSBiaXQgbGV2ZWwp
Ogo+IFJVTk5JTkcgLT4gMDAKPiBTVE9QUEVEIC0+IDAxCj4gTE9HR0lORy9SVU5OSU5HIC0+IDEw
Cj4gTE9HR0lORy9TVE9QUEVEIC0+IDExCj4gCgpZZXMuCgo+ID4gPiA+ICsgKiBJdCBtdXN0IGJl
IHNldCBhbG9uZ3NpZGUgd2l0aCBzdGF0ZSBSVU5OSU5HIG9yIFNUT1AsIGkuZSwKPiA+ID4gPiAr
ICogUlVOTklORyAmIExPR0dJTkcsIFNUT1AgJiBMT0dHSU5HLgo+ID4gPiA+ICsgKiBJdCBpcyB1
c2VkIGZvciBkaXJ0eSBkYXRhIGxvZ2dpbmcgYm90aCBmb3IgZGV2aWNlIG1lbW9yeQo+ID4gPiA+
ICsgKiBhbmQgc3lzdGVtIG1lbW9yeS4KPiA+ID4gPiArICoKPiA+ID4gPiArICogTE9HR0lORyBv
bmx5IGltcGFjdHMgZGV2aWNlL3N5c3RlbSBtZW1vcnkuIEluIExPR0dJTkcgc3RhdGUsIGdldCBi
dWZmZXIKPiA+ID4gPiArICogb2YgZGV2aWNlIG1lbW9yeSByZXR1cm5zIGRpcnR5IHBhZ2VzIHNp
bmNlIGxhc3QgY2FsbDsgb3V0c2lkZSBMT0dHSU5HCj4gPiA+ID4gKyAqIHN0YXRlLCBnZXQgYnVm
ZmVyIG9mIGRldmljZSBtZW1vcnkgcmV0dXJucyB3aG9sZSBzbmFwc2hvdCBvZiBkZXZpY2UKPiA+
ID4gPiArICogbWVtb3J5LiBzeXN0ZW0gbWVtb3J5J3MgZGlydHkgcGFnZSBpcyBvbmx5IGF2YWls
YWJsZSBpbiBMT0dHSU5HIHN0YXRlLgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBEZXZpY2UgY29u
ZmlnIHNob3VsZCBiZSBhbHdheXMgYWNjZXNzaWJsZSBhbmQgcmV0dXJuIHdob2xlIGNvbmZpZyBz
bmFwc2hvdAo+ID4gPiA+ICsgKiByZWdhcmRsZXNzIG9mIExPR0dJTkcgc3RhdGUuCj4gPiA+ID4g
KyAqICovCj4gPiA+ID4gKyNkZWZpbmUgVkZJT19ERVZJQ0VfU1RBVEVfUlVOTklORyAwCj4gPiA+
ID4gKyNkZWZpbmUgVkZJT19ERVZJQ0VfU1RBVEVfU1RPUCAxCj4gPiA+ID4gKyNkZWZpbmUgVkZJ
T19ERVZJQ0VfU1RBVEVfTE9HR0lORyAyCj4gCj4gVGhpcyBtYWtlcyBpdCBsb29rIGEgYml0IGxp
a2UgTE9HR0lORyB3ZXJlIGFuIGluZGl2aWR1YWwgc3RhdGUsIHdoaWxlIDIKPiBpcyBpbiByZWFs
aXR5IExPR0dJTkcvUlVOTklORy4uLiBub3Qgc3VyZSBob3cgdG8gbWFrZSB0aGF0IG1vcmUKPiBv
YnZpb3VzLiBNYXliZSAoYXMgd2UgYXJlIGRlYWxpbmcgd2l0aCBhIHUzMik6Cj4gCj4gI2RlZmlu
ZSBWRklPX0RFVklDRV9TVEFURV9SVU5OSU5HIDB4MDAwMDAwMDAKPiAjZGVmaW5lIFZGSU9fREVW
SUNFX1NUQVRFX1NUT1BQRUQgMHgwMDAwMDAwMQo+ICNkZWZpbmUgVkZJT19ERVZJQ0VfU1RBVEVf
TE9HR0lOR19SVU5OSU5HIDB4MDAwMDAwMDIKPiAjZGVmaW5lIFZGSU9fREVWSUNFX1NUQVRFX0xP
R0dJTkdfU1RPUFBFRCAweDAwMDAwMDAzCj4gI2RlZmluZSBWRklPX0RFVklDRV9TVEFURV9MT0dH
SU5HX01BU0sgMHgwMDAwMDAwMgo+ClllcywgeW91cnMgYXJlIGJldHRlciwgdGhhbmtzOikKCj4g
PiA+ID4gKwo+ID4gPiA+ICsvKiBhY3Rpb24gdG8gZ2V0IGRhdGEgZnJvbSBkZXZpY2UgbWVtb3J5
IG9yIGRldmljZSBjb25maWcKPiA+ID4gPiArICogdGhlIGFjdGlvbiBpcyB3cml0ZSB0byBkZXZp
Y2Ugc3RhdGUncyBjb250cm9sIHJlZ2lvbiwgYW5kIGRhdGEgaXMgcmVhZAo+ID4gPiA+ICsgKiBm
cm9tIGRldmljZSBtZW1vcnkgcmVnaW9uIG9yIGRldmljZSBjb25maWcgcmVnaW9uLgo+ID4gPiA+
ICsgKiBFYWNoIHRpbWUgYmVmb3JlIHJlYWQgZGV2aWNlIG1lbW9yeSByZWdpb24gb3IgZGV2aWNl
IGNvbmZpZyByZWdpb24sCj4gPiA+ID4gKyAqIGFjdGlvbiBWRklPX0RFVklDRV9EQVRBX0FDVElP
Tl9HRVRfQlVGRkVSIGlzIHJlcXVpcmVkIHRvIHdyaXRlIHRvIGFjdGlvbgo+ID4gPiA+ICsgKiBm
aWVsZCBpbiBjb250cm9sIHJlZ2lvbi4gVGhhdCBpcyBiZWNhdXNlIGRldmljZSBtZW1vcnkgYW5k
IGRldmllIGNvbmZpZwo+ID4gPiA+ICsgKiByZWdpb24gaXMgbW1hcGVkIGludG8gdXNlciBzcGFj
ZS4gdmVuZG9yIGRyaXZlciBoYXMgdG8gYmUgbm90aWZpZWQgb2YKPiA+ID4gPiArICogdGhlIHRo
ZSBHRVRfQlVGRkVSIGFjdGlvbiBpbiBhZHZhbmNlLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArI2Rl
ZmluZSBWRklPX0RFVklDRV9EQVRBX0FDVElPTl9HRVRfQlVGRkVSIDEKPiA+ID4gPiArCj4gPiA+
ID4gKy8qIGFjdGlvbiB0byBzZXQgZGF0YSB0byBkZXZpY2UgbWVtb3J5IG9yIGRldmljZSBjb25m
aWcKPiA+ID4gPiArICogdGhlIGFjdGlvbiBpcyB3cml0ZSB0byBkZXZpY2Ugc3RhdGUncyBjb250
cm9sIHJlZ2lvbiwgYW5kIGRhdGEgaXMKPiA+ID4gPiArICogd3JpdHRlbiB0byBkZXZpY2UgbWVt
b3J5IHJlZ2lvbiBvciBkZXZpY2UgY29uZmlnIHJlZ2lvbi4KPiA+ID4gPiArICogRWFjaCB0aW1l
IGFmdGVyIHdyaXRlIHRvIGRldmljZSBtZW1vcnkgcmVnaW9uIG9yIGRldmljZSBjb25maWcgcmVn
aW9uLAo+ID4gPiA+ICsgKiBhY3Rpb24gVkZJT19ERVZJQ0VfREFUQV9BQ1RJT05fR0VUX0JVRkZF
UiBpcyByZXF1aXJlZCB0byB3cml0ZSB0byBhY3Rpb24KPiA+ID4gPiArICogZmllbGQgaW4gY29u
dHJvbCByZWdpb24uIFRoYXQgaXMgYmVjYXVzZSBkZXZpY2UgbWVtb3J5IGFuZCBkZXZpZSBjb25m
aWcKPiA+ID4gPiArICogcmVnaW9uIGlzIG1tYXBlZCBpbnRvIHVzZXIgc3BhY2UuIHZlbmRvciBk
cml2ZXIgaGFzIHRvIGJlIG5vdGlmaWVkIG9mCj4gPiA+ID4gKyAqIHRoZSB0aGUgU0VUX0JVRkZF
UiBhY3Rpb24gYWZ0ZXIgZGF0YSB3cml0dGVuLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArI2RlZmlu
ZSBWRklPX0RFVklDRV9EQVRBX0FDVElPTl9TRVRfQlVGRkVSIDIgIAo+ID4gPiAKPiA+ID4gTGV0
IG1lIGRlc2NyaWJlIHRoaXMgaW4gbXkgb3duIHdvcmRzIHRvIG1ha2Ugc3VyZSB0aGF0IEkgdW5k
ZXJzdGFuZAo+ID4gPiB0aGlzIGNvcnJlY3RseS4KPiA+ID4gCj4gPiA+IC0gVGhlIGFjdGlvbnMg
YXJlIHNldCBieSB1c2Vyc3BhY2UgdG8gbm90aWZ5IHRoZSBrZXJuZWwgdGhhdCBpdCBpcwo+ID4g
PiAgIGdvaW5nIHRvIGdldCBkYXRhIG9yIHRoYXQgaXQgaGFzIGp1c3Qgd3JpdHRlbiBkYXRhLgo+
ID4gPiAtIFRoaXMgaXMgbmVlZGVkIGFzIGEgbm90aWZpY2F0aW9uIHRoYXQgdGhlIG1tYXBwZWQg
ZGF0YSBzaG91bGQgbm90IGJlCj4gPiA+ICAgY2hhbmdlZCByZXNwLiBqdXN0IGhhcyBjaGFuZ2Vk
LiAgCj4gPiB3ZSBuZWVkIHRoaXMgbm90aWZpY2F0aW9uIGlzIGJlY2F1c2Ugd2hlbiB1c2Vyc3Bh
Y2UgcmVhZCB0aGUgbW1hcHBlZCBkYXRhLAo+ID4gaXQncyBmcm9tIHRoZSBwdHIgcmV0dXJuZWQg
ZnJvbSBtbWFwKCkuIFNvLCB3aGVuIHVzZXJzcGFjZSByZWFkcyB0aGF0IHB0ciwKPiA+IHRoZXJl
IHdpbGwgYmUgbm8gcGFnZSBmYXVsdCBvciByZWFkL3dyaXRlIHN5c3RlbSBjYWxscywgc28gdmVu
ZG9yIGRyaXZlcgo+ID4gZG9lcyBub3Qga25vdyB3aGV0aGVyIHJlYWQvd3JpdGUgb3BlcnRhdGlv
biBoYXBwZW5zIG9yIG5vdC4gCj4gPiBUaGVyZWZvcmUsIGJlZm9yZSB1c2Vyc3BhY2UgcmVhZHMg
dGhlIHB0ciBmcm9tIG1tYXAsIGl0IGZpcnN0IHdyaXRlcyBhY3Rpb24KPiA+IGZpZWxkIGluIGNv
bnRyb2wgcmVnaW9uICh0aHJvdWdoIHdyaXRlIHN5c3RlbSBjYWxsKSwgYW5kIHZlbmRvciBkcml2
ZXIKPiA+IHdpbGwgbm90IHJldHVybiB0aGUgd3JpdGUgc3lzdGVtIGNhbGwgdW50aWwgZGF0YSBw
cmVwYXJlZC4KPiA+IAo+ID4gV2hlbiB1c2Vyc3BhY2Ugd3JpdGVzIHRvIHRoYXQgcHRyIGZyb20g
bW1hcCwgaXQgd3JpdGVzIGRhdGEgdG8gdGhlIGRhdGEKPiA+IHJlZ2lvbiBmaXJzdCwgdGhlbiB3
cml0ZXMgdGhlIGFjdGlvbiBmaWVsZCBpbiBjb250cm9sIHJlZ2lvbiAodGhyb3VnaCB3cml0ZQo+
ID4gc3lzdGVtIGNhbGwpIHRvIG5vdGlmeSB2ZW5kb3IgZHJpdmVyLiB2ZW5kb3IgZHJpdmVyIHdp
bGwgcmV0dXJuIHRoZSBzeXN0ZW0KPiA+IGNhbGwgYWZ0ZXIgaXQgY29waWVzIHRoZSBidWZmZXIg
Y29tcGxldGVseS4KPiA+ID4gCj4gPiA+IFNvLCBob3cgZG9lcyB0aGUga2VybmVsIGtub3cgd2hl
dGhlciB0aGUgcmVhZCBhY3Rpb24gaGFzIGZpbmlzaGVkIHJlc3AuCj4gPiA+IHdoZXRoZXIgdGhl
IHdyaXRlIGFjdGlvbiBoYXMgc3RhcnRlZD8gRXZlbiBpZiB1c2Vyc3BhY2UgcmVhZHMvd3JpdGVz
IGl0Cj4gPiA+IGFzIGEgd2hvbGUuCj4gPiA+ICAgCj4gPiBrZXJuZWwgZG9lcyBub3QgdG91Y2gg
dGhlIGRhdGEgcmVnaW9uIGV4Y2VwdCB3aGVuIGluIHJlc3BvbnNlIHRvIHRoZQo+ID4gImFjdGlv
biIgd3JpdGUgc3lzdGVtIGNhbGwuCj4gCj4gVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24sIHRo
YXQgbWFrZXMgc2Vuc2UuCj4gKC4uLikKd2VsY29tZTopCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAo+
IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
