// Initial wiring: [0 2 8 1 4 5 6 7 3]
// Resulting wiring: [0 2 8 1 4 5 7 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[1], q[0];
cx q[7], q[8];
