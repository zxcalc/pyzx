// Initial wiring: [7, 10, 12, 6, 3, 13, 15, 11, 0, 1, 8, 14, 4, 5, 2, 9]
// Resulting wiring: [7, 10, 12, 6, 3, 13, 15, 11, 0, 1, 8, 14, 4, 5, 2, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[14], q[13];
cx q[14], q[15];
cx q[15], q[14];
cx q[12], q[13];
cx q[13], q[14];
cx q[10], q[13];
cx q[13], q[14];
cx q[7], q[8];
cx q[6], q[9];
