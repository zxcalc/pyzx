// Initial wiring: [3, 13, 15, 12, 6, 7, 0, 4, 1, 14, 9, 8, 2, 5, 11, 10]
// Resulting wiring: [3, 13, 15, 12, 6, 7, 0, 4, 1, 14, 9, 8, 2, 5, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[6];
cx q[6], q[1];
cx q[13], q[12];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[13];
cx q[11], q[12];
cx q[0], q[7];
