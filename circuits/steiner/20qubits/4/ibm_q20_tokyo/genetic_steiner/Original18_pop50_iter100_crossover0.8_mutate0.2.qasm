// Initial wiring: [1, 6, 3, 0, 17, 13, 15, 18, 4, 14, 5, 7, 2, 11, 10, 19, 8, 12, 16, 9]
// Resulting wiring: [1, 6, 3, 0, 17, 13, 15, 18, 4, 14, 5, 7, 2, 11, 10, 19, 8, 12, 16, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[13];
cx q[11], q[12];
cx q[6], q[7];
cx q[2], q[8];
