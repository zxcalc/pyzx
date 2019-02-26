// Initial wiring: [0 4 2 8 1 5 6 7 3]
// Resulting wiring: [0 4 2 3 1 5 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[2];
cx q[3], q[8];
cx q[0], q[1];
cx q[6], q[5];
cx q[7], q[8];
