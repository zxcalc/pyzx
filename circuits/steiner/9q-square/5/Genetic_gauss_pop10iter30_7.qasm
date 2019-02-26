// Initial wiring: [0 5 2 3 4 1 7 6 8]
// Resulting wiring: [0 5 2 3 4 1 8 6 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[7], q[8];
cx q[1], q[2];
cx q[1], q[4];
cx q[3], q[8];
cx q[6], q[7];
