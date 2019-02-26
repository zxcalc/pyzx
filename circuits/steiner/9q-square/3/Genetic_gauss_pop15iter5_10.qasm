// Initial wiring: [0 1 2 8 5 4 7 6 3]
// Resulting wiring: [0 1 2 7 5 4 8 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[8], q[7];
cx q[6], q[7];
cx q[7], q[4];
