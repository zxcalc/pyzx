// Initial wiring: [0 7 2 8 1 5 6 3 4]
// Resulting wiring: [0 7 2 8 1 5 6 3 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[8], q[7];
cx q[7], q[4];
