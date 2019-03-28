Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp336270ywb;
        Thu, 28 Mar 2019 01:41:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvX/4NCk6U0YJ095HO4EN3tzhxl4Lg6UECaONmk8BTY1d1UqR2LUqg5YVQJPST0cKSuoL2
X-Received: by 2002:a63:7141:: with SMTP id b1mr12022555pgn.331.1553762493926;
        Thu, 28 Mar 2019 01:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553762493; cv=none;
        d=google.com; s=arc-20160816;
        b=sD+IAVcqh+aH70ZZED5ZZjosTEjVLBOyO3K8l90062TOp0Hpz738LVK3iPwMYj0WTI
         DmP9QcHGUjkV7EP1XZQNqUOii+Ubrx0tUOkCNjRje5D6F4SM4tZ+oxPP+O9t9K5QR27V
         ezuHL5IiIwd8ds/ijdUSWyNQ/UvH5eQDpOldWbwkQrb0souMONnWKfiRwdK3/gwpT8Xx
         DLcY+WrOjrUX16dDc3UT8C/J1v6AKNKrrDCj2ajFgYLFWQLn9NpSEA4ireDRuZyZYiWU
         rAuYzUoHZnWQOVkSVZgx5qk7+7t7del96CVnKnW9zzrRKxiCIf+DOhdlAEZHnn8kL0Mm
         /MYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=Wr9Vu061qiqSQNCJWge1/I4qaSdWNGzcHl7ECA1yiZM=;
        b=H6tSv0eOyS4nyCY0ktsCUwGehlZKzVVYlcQOgLb/J8hWBb2WPc60LAHhhBzzQsFkA3
         IsQ7YJUF9VJ/Nrqx1K8zhyket77CGRrc2nt3WMrL9GlWjC3WfPnLr6wEYHqkrxOkrBLl
         GzUmVjhRGroUEhXKVe5psd9P5R0dcbrabxRqjOH/rbg7U+AfGf+NtBvRvC5UFYDCr9IM
         8kk5kd4Ef4ySd9YfzwO3h6PFspfTZu6wzuiV2Go7OWM5Hv9Lr/1qotvksKxLr4OBPBdp
         AtE5DwbVO5wuu8P7mBYDd5w/8Vn3oCbzF0tZKgG6mv8SAudZcSSdtxfXgUEWEgtt5Rdy
         APEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id bg5si21047632plb.235.2019.03.28.01.41.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 01:41:33 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242C289944;
	Thu, 28 Mar 2019 08:41:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B7089944
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Mar 2019 08:41:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 01:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,280,1549958400"; d="scan'208";a="286617986"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2019 01:41:27 -0700
Date: Thu, 28 Mar 2019 04:36:03 -0400
From: Zhao Yan <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190328083602.GE14681@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
 <20190220124242.5a1685c5.cohuck@redhat.com>
 <20190327063509.GD14681@joy-OptiPlex-7040>
 <20190327201854.GG2636@work-vm> <20190327161020.1c013e65@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190327161020.1c013e65@x1.home>
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aGkgQWxleCBhbmQgRGF2ZSwKVGhhbmtzIGZvciB5b3VyIHJlcGxpZXMuClBsZWFzZSBzZWUgbXkg
Y29tbWVudHMgaW5saW5lLgoKT24gVGh1LCBNYXIgMjgsIDIwMTkgYXQgMDY6MTA6MjBBTSArMDgw
MCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIFdlZCwgMjcgTWFyIDIwMTkgMjA6MTg6NTQg
KzAwMDAKPiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+IHdy
b3RlOgo+IAo+ID4gKiBaaGFvIFlhbiAoeWFuLnkuemhhb0BpbnRlbC5jb20pIHdyb3RlOgo+ID4g
PiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAwNzo0Mjo0MlBNICswODAwLCBDb3JuZWxpYSBIdWNr
IHdyb3RlOiAgCj4gPiA+ID4gPiA+ID4gPiAgIGIpIEhvdyBkbyB3ZSBkZXRlY3QgaWYgd2UncmUg
bWlncmF0aW5nIGZyb20vdG8gdGhlIHdyb25nIGRldmljZSBvcgo+ID4gPiA+ID4gPiA+ID4gdmVy
c2lvbiBvZiBkZXZpY2U/ICBPciBzYXkgdG8gYSBkZXZpY2Ugd2l0aCBvbGRlciBmaXJtd2FyZSBv
ciBwZXJoYXBzCj4gPiA+ID4gPiA+ID4gPiBhIGRldmljZSB0aGF0IGhhcyBsZXNzIGRldmljZSBt
ZW1vcnkgPyAgICAKPiA+ID4gPiA+ID4gPiBBY3R1YWxseSBpdCdzIHN0aWxsIGFuIG9wZW4gZm9y
IFZGSU8gbWlncmF0aW9uLiBOZWVkIHRvIHRoaW5rIGFib3V0Cj4gPiA+ID4gPiA+ID4gd2hldGhl
ciBpdCdzIGJldHRlciB0byBjaGVjayB0aGF0IGluIGxpYnZpcnQgb3IgcWVtdSAobGlrZSBhIGRl
dmljZSBtYWdpYwo+ID4gPiA+ID4gPiA+IGFsb25nIHdpdGggdmVyaW9uID8pLiAgICAKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gV2UgbXVzdCBrZWVwIHRoZSBoYXJkd2FyZSBnZW5lcmF0aW9uIGlzIHRo
ZSBzYW1lIHdpdGggb25lIFBPRCBvZiBwdWJsaWMgY2xvdWQKPiA+ID4gPiA+IHByb3ZpZGVycy4g
QnV0IHdlIHN0aWxsIHRoaW5rIGFib3V0IHRoZSBsaXZlIG1pZ3JhdGlvbiBiZXR3ZWVuIGZyb20g
dGhlIHRoZSBsb3dlcgo+ID4gPiA+ID4gZ2VuZXJhdGlvbiBvZiBoYXJkd2FyZSBtaWdyYXRlZCB0
byB0aGUgaGlnaGVyIGdlbmVyYXRpb24uICAKPiA+ID4gPiAKPiA+ID4gPiBBZ3JlZWQsIGxvd2Vy
LT5oaWdoZXIgaXMgdGhlIG9uZSBkaXJlY3Rpb24gdGhhdCBtaWdodCBtYWtlIHNlbnNlIHRvCj4g
PiA+ID4gc3VwcG9ydC4KPiA+ID4gPiAKPiA+ID4gPiBCdXQgcmVnYXJkbGVzcyBvZiB0aGF0LCBJ
IHRoaW5rIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgaW5jb21wYXRpYmxlCj4gPiA+ID4gZGV2
aWNlcy92ZXJzaW9ucyBmYWlsIGRpcmVjdGx5IGluc3RlYWQgb2YgZmFpbGluZyBpbiBhIHN1YnRs
ZSwgaGFyZCB0bwo+ID4gPiA+IGRlYnVnIHdheS4gTWlnaHQgYmUgdXNlZnVsIHRvIGRvIHNvbWUg
aW5pdGlhbCBzYW5pdHkgY2hlY2tzIGluIGxpYnZpcnQKPiA+ID4gPiBhcyB3ZWxsLgo+ID4gPiA+
IAo+ID4gPiA+IEhvdyBlYXN5IGlzIGl0IHRvIG9idGFpbiB0aGF0IGluZm9ybWF0aW9uIGluIGEg
Zm9ybSB0aGF0IGNhbiBiZQo+ID4gPiA+IGNvbnN1bWVkIGJ5IGhpZ2hlciBsYXllcnM/IENhbiB3
ZSBmaW5kIG91dCB0aGUgZGV2aWNlIHR5cGUgYXQgbGVhc3Q/Cj4gPiA+ID4gV2hhdCBhYm91dCBz
b21lIGtpbmQgb2YgcmV2aXNpb24/ICAKPiA+ID4gaGkgQWxleCBhbmQgQ29ybmVsaWEKPiA+ID4g
Zm9yIGRldmljZSBjb21wYXRpYmlsaXR5LCBkbyB5b3UgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0
byB1c2UgInZlcnNpb24iCj4gPiA+IGFuZCAiZGV2aWNlIHZlcnNpb24iIGZpZWxkcz8KPiA+ID4g
Cj4gPiA+IHZlcnNpb24gZmllbGQ6IGlkZW50aWZ5IGxpdmUgbWlncmF0aW9uIGludGVyZmFjZSdz
IHZlcnNpb24uIGl0IGNhbiBoYXZlIGEKPiA+ID4gc29ydCBvZiBiYWNrd2FyZCBjb21wYXRpYmls
aXR5LCBsaWtlIHRhcmdldCBtYWNoaW5lJ3MgdmVyc2lvbiA+PSBzb3VyY2UKPiA+ID4gbWFjaGlu
ZSdzIHZlcnNpb24uIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gCj4gRG9uJ3Qgd2UgZXNzZW50aWFs
bHkgYWxyZWFkeSBoYXZlIHRoaXMgdmlhIHRoZSBkZXZpY2Ugc3BlY2lmaWMgcmVnaW9uPwo+IFRo
ZSBzdHJ1Y3QgdmZpb19pbmZvX2NhcF9oZWFkZXIgaW5jbHVkZXMgaWQgYW5kIHZlcnNpb24gZmll
bGRzLCBzbyB3ZQo+IGNhbiBkZWNsYXJlIGEgbWlncmF0aW9uIGlkIGFuZCBpbmNyZW1lbnQgdGhl
IHZlcnNpb24gZm9yIGFueQo+IGluY29tcGF0aWJsZSBjaGFuZ2VzIHRvIHRoZSBwcm90b2NvbC4K
eWVzLCBnb29kIGlkZWEhCnNvLCB3aGF0IGFib3V0IGRlY2xhcmluZyBiZWxvdyBuZXcgY2FwPyAK
ICAgICNkZWZpbmUgVkZJT19SRUdJT05fSU5GT19DQVBfTUlHUkFUSU9OIDQKICAgIHN0cnVjdCB2
ZmlvX3JlZ2lvbl9pbmZvX2NhcF9taWdyYXRpb24gewogICAgICAgIHN0cnVjdCB2ZmlvX2luZm9f
Y2FwX2hlYWRlciBoZWFkZXI7CiAgICAgICAgX191MzIgZGV2aWNlX3ZlcnNpb25fbGVuOwogICAg
ICAgIF9fdTggIGRldmljZV92ZXJzaW9uW107CiAgICB9OwoKCj4gPiA+IAo+ID4gPiBkZXZpY2Vf
dmVyc2lvbiBmaWVsZCBjb25zaXN0cyB0d28gcGFydHM6Cj4gPiA+IDEuIHZlbmRvciBpZCA6IGl0
IHRha2VzIDMyIGJpdHMuIGUuZy4gMHg4MDg2Lgo+IAo+IFdobyBhbGxvY2F0ZXMgSURzPyAgSWYg
d2UncmUgZ29pbmcgdG8gdXNlIFBDSSB2ZW5kb3IgSURzLCB0aGVuIEknZAo+IHN1Z2dlc3Qgd2Ug
dXNlIGEgYml0IHRvIGZsYWcgaXQgYXMgc3VjaCBzbyB3ZSBjYW4gcmVzZXJ2ZSB0aGF0IHBvcnRp
b24KPiBvZiB0aGUgMzJiaXQgYWRkcmVzcyBzcGFjZS4gIFNlZSBmb3IgZXhhbXBsZToKPiAKPiAj
ZGVmaW5lIFZGSU9fUkVHSU9OX1RZUEVfUENJX1ZFTkRPUl9UWVBFICAgICAgICAoMSA8PCAzMSkK
PiAjZGVmaW5lIFZGSU9fUkVHSU9OX1RZUEVfUENJX1ZFTkRPUl9NQVNLICAgICAgICAoMHhmZmZm
KQo+IAo+IEZvciB2ZW5kb3Igc3BlY2lmaWMgcmVnaW9ucy4KWWVzLCB1c2UgUENJIHZlbmRvciBJ
RC4KeW91IGFyZSByaWdodCwgd2UgbmVlZCB0byB1c2UgaGlnaGVzdCBiaXQgKFZGSU9fUkVHSU9O
X1RZUEVfUENJX1ZFTkRPUl9UWVBFKQp0byBpZGVudGlmeSBpdCdzIGEgUENJIElELgpUaGFua3Mg
Zm9yIHBvaW50aW5nIGl0IG91dC4gCkJ1dCwgSSBoYXZlIGEgcXVlc3Rpb24uIHdoYXQgaXMgVkZJ
T19SRUdJT05fVFlQRV9QQ0lfVkVORE9SX01BU0sgdXNlZCBmb3I/CndoeSBpdCdzIDB4ZmZmZj8g
SSBzZWFyY2hlZCBRRU1VIGFuZCBrZXJuZWwgY29kZSBhbmQgZGlkIG5vdCBmaW5kIGFueXdoZXJl
CnVzZXMgaXQuCgoKPiA+ID4gMi4gdmVuZG9yIHByb3ByaWV0YXJ5IHN0cmluZzogaXQgY2FuIGJl
IGFueSBzdHJpbmcgdGhhdCBhIHZlbmRvciBkcml2ZXIKPiA+ID4gdGhpbmtzIGNhbiBpZGVudGlm
eSBhIHNvdXJjZSBkZXZpY2UuIGUuZy4gcGNpaWQgKyBtZGV2IHR5cGUuCj4gPiA+ICJ2ZW5kb3Ig
aWQiIGlzIHRvIGF2b2lkIG92ZXJsYXAgb2YgInZlbmRvciBwcm9wcmlldGFyeSBzdHJpbmciLgo+
ID4gPiAKPiA+ID4gCj4gPiA+IHN0cnVjdCB2ZmlvX2RldmljZV9zdGF0ZV9jdGwgewo+ID4gPiAg
ICAgIF9fdTMyIHZlcnNpb247ICAgICAgICAgICAgLyogcm8gKi8KPiA+ID4gICAgICBfX3U4IGRl
dmljZV92ZXJzaW9uW01BWF9ERVZJQ0VfVkVSU0lPTl9MRU5dOyAgICAgICAgICAgIC8qIHJvICov
Cj4gPiA+ICAgICAgc3RydWN0IHsKPiA+ID4gICAgICAJX191MzIgYWN0aW9uOyAvKiBHRVRfQlVG
RkVSLCBTRVRfQlVGRkVSLCBJU19DT01QQVRJQkxFKi8KPiA+ID4gCS4uLgo+ID4gPiAgICAgIH1k
YXRhOwo+ID4gPiAgICAgIC4uLgo+ID4gPiAgfTsKPiAKPiBXZSBoYXZlIGEgYnVmZmVyIGFyZWEg
d2hlcmUgd2UgY2FuIHJlYWQgYW5kIHdyaXRlIGRhdGEgZnJvbSB0aGUgdmVuZG9yCj4gZHJpdmVy
LCB3aHkgd291bGQgd2UgaGF2ZSB0aGlzIElTX0NPTVBBVElCTEUgcHJvdG9jb2wgdG8gd3JpdGUg
dGhlCj4gZGV2aWNlIHZlcnNpb24gc3RyaW5nIGJ1dCB1c2UgYSBzdGF0aWMgZml4ZWQgbGVuZ3Ro
IHZlcnNpb24gc3RyaW5nIGluCj4gdGhlIGNvbnRyb2wgaGVhZGVyIHRvIHJlYWQgaXQ/ICBJT1cs
IGxldCdzIHVzZSBHRVRfVkVSU0lPTiwKPiBDSEVDS19WRVJTSU9OIGFjdGlvbnMgdGhhdCBtYWtl
IHVzZSBvZiB0aGUgYnVmZmVyIGFyZWEgYW5kIGFsbG93IHZlbmRvcgo+IHNwZWNpZmljIHZlcnNp
b24gaW5mb3JtYXRpb24gbGVuZ3RoLgp5b3UgYXJlIHJpZ2h0LCBzdWNoIHN0YXRpYyBmaXhlZCBs
ZW5ndGggdmVyc2lvbiBzdHJpbmcgaXMgYmFkIDopClRvIGdldCBkZXZpY2UgdmVyc2lvbiwgZG8g
eW91IHRoaW5rIHdoaWNoIGFwcHJvYWNoIGJlbG93IGlzIGJldHRlcj8KMS4gdXNlIEdFVF9WRVJT
SU9OIGFjdGlvbiwgYW5kIHJlYWQgZnJvbSByZWdpb24gYnVmZmVyCjIuIGdldCBpdCB3aGVuIHF1
ZXJ5aW5nIGNhcCBWRklPX1JFR0lPTl9JTkZPX0NBUF9NSUdSQVRJT04KCnNlZW1zIGFwcHJvYWNo
IDEgaXMgYmV0dGVyLCBhbmQgY2FwIFZGSU9fUkVHSU9OX0lORk9fQ0FQX01JR1JBVElPTiBpcyBv
bmx5CmZvciBjaGVja2luZyBtaWdyYXRpb24gaW50ZXJmYWNlJ3MgdmVyc2lvbj8KCj4gPiA+IAo+
ID4gPiBUaGVuLCBhbiBhY3Rpb24gSVNfQ09NUEFUSUJMRSBpcyBhZGRlZCB0byBjaGVjayBkZXZp
Y2UgY29tcGF0aWJpbGl0eS4KPiA+ID4gCj4gPiA+IFRoZSBmbG93IHRvIGZpZ3VyZSBvdXQgd2hl
dGhlciBhIHNvdXJjZSBkZXZpY2UgaXMgbWlncmF0YWJsZSB0byB0YXJnZXQgZGV2aWNlCj4gPiA+
IGlzIGxpa2UgdGhhdDoKPiA+ID4gMS4gaW4gc291cmNlIHNpZGUncyAuc2F2ZV9zZXR1cCwgc2F2
ZSBzb3VyY2UgZGV2aWNlJ3MgZGV2aWNlX3ZlcnNpb24gc3RyaW5nCj4gPiA+IDIuIGluIHRhcmdl
dCBzaWRlJ3MgLmxvYWRfc3RhdGUsIGxvYWQgc291cmNlIGRldmljZSdzIGRldmljZSB2ZXJzaW9u
IHN0cmluZwo+ID4gPiBhbmQgd3JpdGUgaXQgdG8gZGF0YSByZWdpb24sIGFuZCBjYWxsIElTX0NP
TVBBVElCTEUgYWN0aW9uIHRvIGFzayB2ZW5kb3IgZHJpdmVyCj4gPiA+IHRvIGNoZWNrIHdoZXRo
ZXIgdGhlIHNvdXJjZSBkZXZpY2UgaXMgY29tcGF0aWJsZSB0byBpdC4KPiA+ID4gCj4gPiA+IFRo
ZSBhZHZhbnRhZ2Ugb2YgYWRkaW5nIGFuIElTX0NPTVBBVElCTEUgYWN0aW9uIGlzIHRoYXQsIHZl
bmRvciBkcml2ZXIgY2FuCj4gPiA+IG1haW50YWluIGEgY29tcGF0aWJpbGl0eSB0YWJsZSBhbmQg
ZGVjaWRlIHdoZXRoZXIgc291cmNlIGRldmljZSBpcyBjb21wYXRpYmxlCj4gPiA+IHRvIHRhcmdl
dCBkZXZpY2UgYWNjb3JkaW5nIHRvIGl0cyBwcm9wcmlldGFyeSB0YWJsZS4KPiA+ID4gSW4gZGV2
aWNlX3ZlcnNpb24gc3RyaW5nLCB2ZW5kb3IgZHJpdmVyIG9ubHkgaGFzIHRvIGRlc2NyaWJlIHRo
ZSBzb3VyY2UKPiA+ID4gZGV2aWNlIGFzIGVsYWJvcmF0ZWx5IGFzIHBvc3NpYmxlIGFuZCByZXNv
cnRzIHRvIHZlbmRvciBkcml2ZXIgaW4gdGFyZ2V0IHNpZGUKPiA+ID4gdG8gZmlndXJlIG91dCB3
aGV0aGVyIHRoZXkgYXJlIGNvbXBhdGlibGUuICAKPiAKPiBJIGFncmVlLCBpdCdzIHRvbyBjb21w
bGljYXRlZCBhbmQgcmVzdHJpY3RpdmUgdG8gdHJ5IHRvIGNyZWF0ZSBhbgo+IGludGVyZmFjZSBm
b3IgdGhlIHVzZXIgdG8gZGV0ZXJtaW5lIGNvbXBhdGliaWxpdHksIGxldCB0aGUgZHJpdmVyCj4g
ZGVjbGFyZSBpdCBjb21wYXRpYmxlIG9yIG5vdC4KOikKCj4gPiBJdCB3b3VsZCBhbHNvIGJlIGdv
b2QgaWYgdGhlICdJU19DT01QQVRJQkxFJyB3YXMgc29tZWhvdyBjYWxsYWJsZQo+ID4gZXh0ZXJu
YWxseSAtIHNvIHdlIGNvdWxkIGJlIGFibGUgdG8gYW5zd2VyIGEgcXVlc3Rpb24gbGlrZSAnY2Fu
IHdlCj4gPiBtaWdyYXRlIHRoaXMgVk0gdG8gdGhpcyBob3N0JyAtIGZyb20gdGhlIG1hbmFnZW1l
bnQgbGF5ZXIgYmVmb3JlIGl0Cj4gPiBhY3R1YWxseSBzdGFydHMgdGhlIG1pZ3JhdGlvbi4KCnNv
IHFlbXUgbmVlZHMgdG8gZXhwb3NlIHR3byBxbXAvc3lzZnMgaW50ZXJmYWNlczogR0VUX1ZFUlNJ
T04gYW5kIENIRUNLX1ZFUlNJT04uCkdFVF9WRVJTSU9OIHJldHVybnMgYSB2bSdzIGRldmljZSdz
IHZlcnNpb24gc3RyaW5nLgpDSEVDS19WRVJTSU9OJ3MgaW5wdXQgaXMgZGV2aWNlIHZlcnNpb24g
c3RyaW5nIGFuZCByZXR1cm4KY29tcGF0aWJsZS9ub24tY29tcGF0aWJsZS4KRG8geW91IHRoaW5r
IGl0J3MgZ29vZD8KCj4gSSB0aGluayB3ZSdkIG5lZWQgdG8gbWlycm9yIHRoaXMgY2FwYWJpbGl0
eSBpbiBzeXNmcyB0byBzdXBwb3J0IHRoYXQsCj4gb3IgY3JlYXRlIGEgcW1wIGludGVyZmFjZSB0
aHJvdWdoIFFFTVUgdGhhdCB0aGUgZGV2aWNlIG93bmVyIGNvdWxkIG1ha2UKPiB0aGUgcmVxdWVz
dCBvbiBiZWhhbGYgb2YgdGhlIG1hbmFnZW1lbnQgbGF5ZXIuICBHZXR0aW5nIGFjY2VzcyB0byB0
aGUKPiB2ZmlvIGRldmljZSByZXF1aXJlcyBhbiBpb21tdSBjb250ZXh0IHRoYXQncyBhbHJlYWR5
IGluIHVzZSBieSB0aGUKPiBkZXZpY2Ugb3duZXIsIHdlIGhhdmUgbm8gaW50ZW50aW9uIG9mIHN1
cHBvcnRpbmcgYSBtb2RlbCB0aGF0IGFsbG93cwo+IGluZGVwZW5kZW50IHRhc2tzIGFjY2VzcyB0
byBhIGRldmljZS4gIFRoYW5rcywKPiBBbGV4Cj4KZG8geW91IHRoaW5rIHR3byBzeXNmcyBub2Rl
cyB1bmRlciBhIGRldmljZSBub2RlIGlzIG9rPwplLmcuCi9zeXMvZGV2aWNlcy9wY2kwMDAwXDow
MC8wMDAwXDowMFw6MDIuMC84ODJjYzRkYS1kZWRlLTExZTctOTE4MC0wNzhhNjIwNjNhYjEvZ2V0
X3ZlcnNpb24KL3N5cy9kZXZpY2VzL3BjaTAwMDBcOjAwLzAwMDBcOjAwXDowMi4wLzg4MmNjNGRh
LWRlZGUtMTFlNy05MTgwLTA3OGE2MjA2M2FiMS9jaGVja192ZXJzaW9uCgpUaGFua3MKWWFuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
