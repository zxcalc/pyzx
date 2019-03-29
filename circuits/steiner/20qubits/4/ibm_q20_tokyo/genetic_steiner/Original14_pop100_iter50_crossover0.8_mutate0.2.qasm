// Initial wiring: [6, 1, 18, 12, 16, 10, 8, 3, 13, 11, 4, 2, 19, 9, 7, 0, 5, 15, 14, 17]
// Resulting wiring: [6, 1, 18, 12, 16, 10, 8, 3, 13, 11, 4, 2, 19, 9, 7, 0, 5, 15, 14, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[18], q[17];
cx q[13], q[14];
cx q[11], q[18];
